package com.ibm.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.TreeMap;

import org.apache.commons.logging.impl.SimpleLog;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.ibm.service.NlpService;

import kr.bydelta.koala.POS;
import kr.bydelta.koala.POS$;
import kr.bydelta.koala.data.Sentence;
import kr.bydelta.koala.eunjeon.JavaDictionary;
import kr.bydelta.koala.eunjeon.Tagger;

@Service
public class NlpServiceImpl implements NlpService{

	static Logger logger = Logger.getLogger(SimpleLog.class);

	@Override
	public List<String> FindKeyWordList(String text) {
		
		/* 사용자정의사전 사용법 */
		// 1. 형태소 기본형 추가.
		List<String> list = new LinkedList<>();
		list.add("설빙");
		list.add("구글하");

		// 2. 기본형별 품사 지정.
		List<POS$.Value> pos = new LinkedList<>();
		pos.add(POS.NNG());
		pos.add(POS.VV());

		// 3. JavaDictionary에 추가.
		JavaDictionary.addUserDictionary(list, pos);

		/* Tagger 사용법 */
		Tagger tagger = new Tagger();
		String line;
		List<String> WordsList = new ArrayList<String>();

		line = text;
		if (!line.isEmpty()) {

			// 문단 단위를 Tagging하는 경우:
			// List<Sentence> paragraph = tagger.jTag(line);
			// 1개 문장인 경우는, 아래와 같습니다.
			Sentence sent = tagger.tagSentence(line);
			String sentString = sent.nouns().toString();
			String[] breakString = sentString.split("=");
			// WordsList.add(breakString[0].split("\\(")[1].trim());
			for (int i = 1; i < breakString.length - 1; i++) {
				String nouns = breakString[i].split("/")[0];
				if (nouns.length() > 2) {
					WordsList.add(breakString[i].split("/")[0]);
				}
			}
		}
		
		HashMap<String, Integer> wordsMap = new HashMap<>();

		// count
		for (String word : WordsList) {
			if (wordsMap.get(word) != null) {
				wordsMap.put(word, wordsMap.get(word) + 1);
			} else {
				wordsMap.put(word, 1);
			}
		}
		
		text = text.replaceAll("[^-?a-zA-Z]+", " ").toLowerCase();
  	List<String> EngWordList = Arrays.asList(text.trim().split(" "));
  	
		for (String engWord : EngWordList) {
			if (wordsMap.get(engWord) != null) {
				wordsMap.put(Character.toUpperCase(engWord.charAt(0)) + engWord.substring(1), wordsMap.get(engWord) + 1);
			} else {
				wordsMap.put(engWord, 1);
			}
		}
		
		wordsMap.remove("?");
		TreeMap<String, Integer> sortedMap = sortMapByValue(wordsMap);
		List<String> sortedList = new ArrayList<String>(sortedMap.keySet());

		logger.info(sortedMap);

		return sortedList;
	}

	public static TreeMap<String, Integer> sortMapByValue(HashMap<String, Integer> map) {
		Comparator<String> comparator = new ValueComparator(map);
		// TreeMap is a map sorted by its keys.
		// The comparator is used to sort the TreeMap by keys.
		TreeMap<String, Integer> result = new TreeMap<String, Integer>(comparator);
		result.putAll(map);
		return result;
	}
}

// a comparator that compares Strings
class ValueComparator implements Comparator<String> {
	HashMap<String, Integer> map = new HashMap<String, Integer>();

	public ValueComparator(HashMap<String, Integer> map) {
		this.map.putAll(map);
	}

	@Override
	public int compare(String s1, String s2) {
		if (map.get(s1) >= map.get(s2)) {
			return -1;
		} else {
			return 1;
		}
	}
}

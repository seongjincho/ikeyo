package kh.com.a.util;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsonStringParse {
	public JSONObject stringToJson(String jsonStr, String key) {
		JSONParser parser = new JSONParser();
		Object obj = null;
		try {
			obj = parser.parse(jsonStr);
		} catch(ParseException e) {
			e.printStackTrace();
		}
		
		JSONObject jsonobj = (JSONObject)obj;
		JSONObject response = (JSONObject)jsonobj.get(key);
		
		return response;
	}
	
	public String JsonToString(JSONObject jsonobj, String key) {
		String str = (String)jsonobj.get(key);
		
		return str;
	}
}

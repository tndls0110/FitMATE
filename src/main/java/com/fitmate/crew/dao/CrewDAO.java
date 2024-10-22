package com.fitmate.crew.dao;

import java.util.List;
import java.util.Map;

public interface CrewDAO {

	List<Map> placeFilter();

	List<Map> mbtiFilter();

	List<Map> crewList(int searchFilter, String searchKeyword, int region_idx, int regions_idx, int mbtiFilter,int limit, int offset);

}

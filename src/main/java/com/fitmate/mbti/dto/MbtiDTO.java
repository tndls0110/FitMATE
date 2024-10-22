package com.fitmate.mbti.dto;

import java.util.List;

public class MbtiDTO {
	// 문항 정보
	private int mbtiq_idx; // MBTI 질문 idx
	private String mbtiq_con; // MBTI 질문 내용
	private int admin_idx; // MBTI 질문 관리자 idx

	// 옵션 정보
	private int mbtisub_idx; // MBTI 질문 문항 idx
	private String mbtisub_con; // MBTI 질문 문항 내용

	// 성향 및 점수 정보
	private List<TypeScore> typeScores; // 성향 및 점수 리스트

	// 사용자 정보
	private String user_id; // 유저 아이디

	// 성향과 점수를 저장할 내부 클래스
	public static class TypeScore {
		private int mbtir_idx; // MBTI 성향 idx
		private String mbtir_name; // MBTI 성향 이름
		private String mbtir_img; // MBTI 성향 이미지
		private String mbtir_con; // MBTI 성향 내용
		private String mbtir_exc; // MBTI 성향 추천 운동
		private String mbtir_rou; // MBTI 성향 루틴
		private int mbtiscr_scr; // MBTI 성향에 대한 점수

		// Getter와 Setter
		public int getMbtir_idx() {
			return mbtir_idx;
		}

		public void setMbtir_idx(int mbtir_idx) {
			this.mbtir_idx = mbtir_idx;
		}

		public String getMbtir_name() {
			return mbtir_name;
		}

		public void setMbtir_name(String mbtir_name) {
			this.mbtir_name = mbtir_name;
		}

		public String getMbtir_img() {
			return mbtir_img;
		}

		public void setMbtir_img(String mbtir_img) {
			this.mbtir_img = mbtir_img;
		}

		public String getMbtir_con() {
			return mbtir_con;
		}

		public void setMbtir_con(String mbtir_con) {
			this.mbtir_con = mbtir_con;
		}

		public String getMbtir_exc() {
			return mbtir_exc;
		}

		public void setMbtir_exc(String mbtir_exc) {
			this.mbtir_exc = mbtir_exc;
		}

		public String getMbtir_rou() {
			return mbtir_rou;
		}

		public void setMbtir_rou(String mbtir_rou) {
			this.mbtir_rou = mbtir_rou;
		}

		public int getMbtiscr_scr() {
			return mbtiscr_scr;
		}

		public void setMbtiscr_scr(int mbtiscr_scr) {
			this.mbtiscr_scr = mbtiscr_scr;
		}
	}

	// Getter와 Setter
	public int getMbtiq_idx() {
		return mbtiq_idx;
	}

	public void setMbtiq_idx(int mbtiq_idx) {
		this.mbtiq_idx = mbtiq_idx;
	}

	public String getMbtiq_con() {
		return mbtiq_con;
	}

	public void setMbtiq_con(String mbtiq_con) {
		this.mbtiq_con = mbtiq_con;
	}

	public int getAdmin_idx() {
		return admin_idx;
	}

	public void setAdmin_idx(int admin_idx) {
		this.admin_idx = admin_idx;
	}

	public int getMbtisub_idx() {
		return mbtisub_idx;
	}

	public void setMbtisub_idx(int mbtisub_idx) {
		this.mbtisub_idx = mbtisub_idx;
	}

	public String getMbtisub_con() {
		return mbtisub_con;
	}

	public void setMbtisub_con(String mbtisub_con) {
		this.mbtisub_con = mbtisub_con;
	}

	public List<TypeScore> getTypeScores() {
		return typeScores;
	}

	public void setTypeScores(List<TypeScore> typeScores) {
		this.typeScores = typeScores;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}

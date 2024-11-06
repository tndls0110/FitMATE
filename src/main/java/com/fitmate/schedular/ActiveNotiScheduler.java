package com.fitmate.schedular;

import com.fitmate.notify.dao.NotiDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.LocalTime;

@EnableScheduling
@Component
public class ActiveNotiScheduler {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired NotiDAO notiDAO;
	@Scheduled (cron = "0 0/5 0 * * ?") // cron = "0 0 0 * * ?"
	public void activeNoti() {
		LocalDate thirty_days_ago = LocalDate.now().minusDays(30); //일 수를 구하고 싶다면 localDate
		//logger.info("thirty_days_ago:"+thirty_days_ago.toString());
		int updated_rows = notiDAO.auto_delete(thirty_days_ago);
	}

}

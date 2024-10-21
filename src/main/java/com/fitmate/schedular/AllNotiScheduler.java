package com.fitmate.schedular;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

@EnableScheduling
@Component
public class AllNotiScheduler {
	Logger logger = LoggerFactory.getLogger(getClass());

}

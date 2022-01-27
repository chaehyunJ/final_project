package com.itbank.component;

import java.util.TimerTask;

public class Timer {

	public static void main(String[] args) {
		Timer m_timer = new Timer();
		TimerTask m_task = new TimerTask() {
			
			@Override
			public void run() {
				System.out.println("timer");
			}
		};
		m_timer.schedule(m_task, 5000);
	}

	private void schedule(TimerTask task, long delay) {
		
	}

}

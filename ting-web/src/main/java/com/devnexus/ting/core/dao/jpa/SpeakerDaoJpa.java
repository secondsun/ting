/*
 * Copyright 2002-2011 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.devnexus.ting.core.dao.jpa;

import java.util.List;

import org.hibernate.Filter;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.devnexus.ting.core.dao.SpeakerDao;
import com.devnexus.ting.core.model.Speaker;

@Repository("speakerDao")
public class SpeakerDaoJpa extends GenericDaoJpa< Speaker, Long>
						   implements SpeakerDao {

	/** Constructor. */
	private SpeakerDaoJpa() {
		super(Speaker.class);
	}

	@Override
	public List<Speaker> getAllSpeakersOrderedByName() {
		return super.entityManager
		.createQuery("select s from Speaker s "
				   + "order by s.lastName ASC, s.firstName ASC", Speaker.class)
		.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Speaker> getSpeakersForCurrentEvent() {

		final Session session = (Session) super.entityManager.getDelegate();

		session.enableFilter("presentationFilter");

		final List<Speaker> speakers = (List<Speaker>) session.createQuery("select s from Speaker s "
				   + "    join fetch s.events e "
				   + "    where e.current = :iscurrent "
				   + "    order by s.lastName ASC, s.firstName ASC")
		.setParameter("iscurrent", Boolean.TRUE)
		.setCacheable(true)
		.list();

		return speakers;
	}

	/**
	 * https://hibernate.onjira.com/browse/HHH-6902
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Speaker> getSpeakersForEvent(Long eventId) {

		final Session session = (Session) super.entityManager.getDelegate();
		Filter filter = session.enableFilter("presentationFilterEventId");
		filter.setParameter("eventId", eventId);

		final List<Speaker> speakers = (List<Speaker>) super.entityManager
				.createQuery("select s from Speaker s "
						+ "    join s.events e "
						+ "where e.id = :eventId "
						+ "order by s.lastName ASC")
			 .setParameter("eventId", eventId)
			 .getResultList();

		return speakers;
	}

}

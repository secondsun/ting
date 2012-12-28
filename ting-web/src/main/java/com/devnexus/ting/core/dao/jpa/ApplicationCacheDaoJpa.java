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

import org.springframework.stereotype.Repository;

import com.devnexus.ting.core.dao.ApplicationCacheDao;
import com.devnexus.ting.core.dao.EventDao;
import com.devnexus.ting.core.model.ApplicationCache;
import com.devnexus.ting.core.model.Event;

/**
 *
 * @author Gunnar Hillert
 * @since  1.0
 *
 */
@Repository("applicationCacheDao")
public class ApplicationCacheDaoJpa extends GenericDaoJpa< ApplicationCache, Long>
						   implements ApplicationCacheDao {

	/** Constructor. */
	public ApplicationCacheDaoJpa() {
		super(ApplicationCache.class);
	};


}

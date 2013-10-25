<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License. You may obtain a
    copy of the License at:

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on
    an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied. See the License for the
    specific language governing permissions and limitations
    under the License.

--%>

<rs:resourceURL var="addImg" value="rs/famfamfam/silk/1.3/add.png"/>
<rs:resourceURL var="delImg" value="rs/famfamfam/silk/1.3/delete.png"/>

<div class="jqm-contact" title="${contact.title} ${contact.firstname} ${contact.surname}">

	<div class="jqm-contact-details-holder">
		<c:choose>
	        <c:when test="${!empty contact.imageURI}">
	            <div class="contact-photo jqm-contact-image-holder" rel="${contact.imageURI}" ></div>
	        </c:when>
	        <c:otherwise>
	            <div class="contact-photo jqm-contact-image-holder">
	                <img src="${BASEURL}/images/image_unavailable.jpg"/>
	            </div>
	        </c:otherwise>
	    </c:choose>
	    <div class="clear"></div>
	    
	    <div class="jqm-contact-name">${contact.title} ${contact.firstname} ${contact.surname}</div>
	    <div class="jqm-contact-position">${contact.position}</div>
	    <div class="jqm-contact-department">${contact.department}</div>
	    
	    <c:forEach items="${contact.phoneNumbers}" var="phoneNumber">
	    	<div class="jqm-phone-number">
		        <img style="vertical-align:middle" src="${pageContext.request.contextPath}/images/telephone.png" height="16" width="16" alt="<spring:message code="contact.telephone.title"/>" title="<spring:message code="contact.telephone.title"/>"/> 
		         <b><i>${ phoneNumber.displayType }:</i></b>
        
		        <c:set var="tels" value="${fn:split(phoneNumber.phoneNumber, ',')}" />
		      	<ul>   
		                    
		        <c:forEach items="${tels }"var="tel">
		        	<li>
				        <c:if test="${fn:startsWith(tel, 'p')}">
				        	<i><spring:message code="contact.telephone.internal"/></i>${ fn:substring(tel,1,5) }
				       	</c:if>
				       	<c:if test="${fn:startsWith(tel, ' p')}">
				        	<i><spring:message code="contact.telephone.internal"/></i>${ fn:substring(tel,2,6) }
				       	</c:if>
				       	<c:if test="${!fn:contains(tel, 'p')}">
				         <a href="tel:${tel }">${tel }</a>    	
				        </c:if>
			         </li>
		        </c:forEach>
		        </ul>
	        </div>
	    </c:forEach>
	
	    <c:forEach items="${contact.emailAddresses}" var="emailAddress">
	    	<div class="jqm-email-address">
		        <img style="vertical-align:middle" src="${pageContext.request.contextPath}/images/email.png" height="16" width="16" alt="Email" title="<spring:message code="contact.email.title"/>"/>
		        <c:out value="${ emailAddress.displayType }" default="NULL"/>: <a href="mailto:"><c:out value="${ emailAddress.emailAddress }" default="NULL"/></a><br/>
	        </div>
	    </c:forEach>
	
	
	    <c:if test="${!empty contact.primaryAddress}">
	    	<div class="jqm-primary-address">
	        	${contact.primaryAddress.building}, ${contact.primaryAddress.street}
	        </div>
	    </c:if>		
	</div>
	
	<div class="jqm-contact-action-grid">
		<div class="grid-left">
			<c:set var="tels" value="${fn:split(contact.primaryPhoneNumber.phoneNumber, ',')}" />
			<c:forEach items="${tels }" var="tel">
				<c:if test="${!fn:startsWith(tel, 'p')}">
					<a href="tel:${fn:substringAfter(tel,'+')}" class="jqm-button"><spring:message code="contact.call"/></a>
				</c:if>
			</c:forEach>
		</div>
		<div class="grid-right">
			<a href="mailto:<c:out value="${ contact.primaryEmailAddress.emailAddress }"/>" class="jqm-button"><spring:message code="contact.email"/></a>
		</div>
		<div class="clear"></div>
	</div>

	<div class="clear"></div>

</div>

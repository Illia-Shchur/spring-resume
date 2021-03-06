<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"     	uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" 	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="resume" 	tagdir="/WEB-INF/tags"%>

<resume:edit-tab-header selected="profile" />

<div class="panel panel-default edit-profile">
	<div class="panel-body">
		<c:if test="${profileForm.fullName!=null}">
			<h1 class="text-center">${profileForm.fullName }</h1>
		</c:if>
		<c:if test="${!profileForm.completed }">
		<hr />
		<h4 class="data-header">Следующие поля должны быть заполнены, чтобы завершить регистрацию!</h4>
		</c:if>
		<resume:form-display-error-if-invalid formName="contactsForm" />
		<form:form modelAttribute="profileForm" action="/edit" method="post" cssClass="form-horizontal data-form" enctype="multipart/form-data">

			<form:hidden path="largePhoto"/>
			<form:hidden path="email"/>
			<form:hidden path="completed"/>
			
			<resume:form-has-error path="profilePhoto" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputPhoto" class="col-sm-2 control-label">Фото*</label>
				<div class="col-sm-5">
					<img id="currentPhoto" src="${profileForm.profilePhoto }" alt="image is not available" class="edit-photo"/><br />
					<input type="file" name="profilePhoto" id="profilePhoto" />
					<resume:form-error path="profilePhoto" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>
						1. Фотография может многое рассказать о кандидате: начиная от его эстетических качеств и заканчивая его отношением к поиску серьезной работы<br />
						2. Размер фотографии должен быть не меньше чем 400x400 <br />
						3. Файл должен быть в формате jpg или png<br />
					</blockquote>
				</div>
			</div>

			<resume:form-has-error path="firstName" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputFirstName" class="col-sm-2 control-label">Имя*</label>
				<div class="col-sm-5">
					<form:input path="firstName" class="form-control" id="inputFirstName" placeholder="Ivan" required="required" />
					<resume:form-error path="firstName" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>Пожалуйста указывайте настоящее имя и фамилию</blockquote>
				</div>
			</div>

			<resume:form-has-error path="lastName" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputLastName" class="col-sm-2 control-label">Фамилия*</label>
				<div class="col-sm-5">
					<form:input path="lastName" class="form-control" id="inputLastName" placeholder="Ivanov" required="required" />
					<resume:form-error path="lastName" />
				</div>
				<div class="col-sm-5 help-block"></div>
			</div>


			<resume:form-has-error path="birthDay" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputBirthDay" class="col-sm-2 control-label">Дата рождение*</label>
				<div class="col-sm-5">
					<form:input path="birthDay" class="form-control datepicker" data-date-format="yyyy-mm-dd" id="inputBirthDay" placeholder="Example: 1990-12-31" required="required" />
					<resume:form-error path="birthDay" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>Формат даты: yyyy-mm-dd (четыре цифры года - код месяца - день рождения)</blockquote>
				</div>
			</div>
			<resume:form-has-error path="country" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputCountry" class="col-sm-2 control-label">Страна*</label>
				<div class="col-sm-5">
					<form:input path="country" class="form-control" id="inputCountry" placeholder="Example: Ukraine" required="required" />
					<resume:form-error path="country" />
				</div>
				<div class="col-sm-5 help-block"></div>
			</div>
			<resume:form-has-error path="city" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputCity" class="col-sm-2 control-label">Город*</label>
				<div class="col-sm-5">
					<form:input path="city" class="form-control" id="inputCity" placeholder="Example: Kharkiv" required="required" />
					<resume:form-error path="city" />
				</div>
				<div class="col-sm-5 help-block"></div>
			</div>
			<resume:form-has-error path="email" />

			<resume:form-has-error path="uid" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputUid" class="col-sm-2 control-label">UID</label>
				<div class="col-sm-5">
					<form:input path="uid" class="form-control" id="inputUid" placeholder="UID"  required="required" />
					<resume:form-error path="uid" />
				</div>
				<div class="col-sm-5 help-block"></div>
			</div>
			<resume:form-has-error path="phone" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputPhone" class="col-sm-2 control-label">Телефон*</label>
				<div class="col-sm-5">
					<form:input path="phone" class="form-control" id="inputPhone" placeholder="Example: +380501234567" required="required" />
					<resume:form-error path="phone" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote> Номер телефона нужно предоставлять в формате <a href="https://ru.wikipedia.org/wiki/E.164" target="_blank">E.164</a>, например: +380501234567</blockquote>
				</div>
			</div>
			<resume:form-has-error path="objective" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputObjective" class="col-sm-2 control-label">Желаемая должность*</label>
				<div class="col-sm-5">
					<form:input path="objective" class="form-control" id="inputObjective" placeholder="Example: Junior java developer position" required="required" />
					<resume:form-error path="objective" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>В данном разделе нужно указать желаемую должность</blockquote>
				</div>
			</div>
			<resume:form-has-error path="summary" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputSummary" class="col-sm-2 control-label">Ваша квалификация*</label>
				<div class="col-sm-5">
					<form:textarea path="summary" class="form-control" id="inputSummary" required="required" rows="7"
						placeholder="Example: Two Java professional courses with developing two web applications: blog and resume (Links to demo are provided)" />
					<resume:form-error path="summary" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>
						В данном разделе необходимо описать Ваш опыт (практический или теоретический) по тому направлению в котором Вы ищите работу.
					</blockquote>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">Сохранить</button>
				</div>
			</div>
		</form:form>
	</div>
</div>

<content tag="js-init">
<script>
$(document).ready(function(){
	resume.createDatePicker();
	resume.createPhotoUploader();
});
</script>
</content>
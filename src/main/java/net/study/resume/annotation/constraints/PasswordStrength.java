package net.study.resume.annotation.constraints;

import javax.validation.Constraint;
import javax.validation.Payload;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.RUNTIME;


@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER })
@Retention(RUNTIME)
@Documented
@Constraint(validatedBy = { })
@Size(min=8,message = "password length cannot be less than 8 characters")
@NotNull
@MinDigitCount(message = "Password must contain at least 1 digit")
@MinUpperCharCount(message = "Password must contain at least 1 upper case character")
@MinLowerCharCount(message = "Password must contain at least 1 lower case character")
@MinSpecCharCount(message = "Password must contain at least 1 special character")
public @interface PasswordStrength {

	String message() default "PasswordStrength";
	
	Class<? extends Payload>[] payload() default { };
	
	Class<?>[] groups() default { };
}

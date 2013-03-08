/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.security;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 *
 * @author linangran
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface XSSProtect{
    XSSProtectLevel value();
}

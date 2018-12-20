package com.ssm.model;

/**
 * 作者:wj
 * 时间:2018/12/18
 *   `uid` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号 主键',
 *   `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
 *   `pwd` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
 *   `sex` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '性别',
 *   `age` tinyint(3) NOT NULL COMMENT '年龄',
 *   `professional` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '个人职业',
 *   `love` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '爱好的风景',
 *
 */
public class User {
    private int id;
    private String username;
    private String pwd;
    private String sex;
    private String age;
    private String professional;
    private String love;


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", pwd='" + pwd + '\'' +
                ", sex='" + sex + '\'' +
                ", age='" + age + '\'' +
                ", professional='" + professional + '\'' +
                ", love='" + love + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getProfessional() {
        return professional;
    }

    public void setProfessional(String professional) {
        this.professional = professional;
    }

    public String getLove() {
        return love;
    }

    public void setLove(String love) {
        this.love = love;
    }

    public User() {

    }
}





# Notes List

A complete example for Spring MVC + Maven + Hibernate CRUD operation with search and pagination
# Demo
```
http://zzzadruga.ru:8080/noteslist/notes/list
```
# Running the Application

+ Install Tomcat 8
+ Create user with role "manager-gui" & "manager-script" in %CATALINA_HOME%/conf/tomcat-users.xml 
```
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<user username="admin" password="password" roles="manager-gui,manager-script"/>
```
+ Start Tomcat server. Run startup.bat in %CATALINA_HOME%/bin
+ Create server with name TomcatServer in Maven root directory %M2_HOME%/conf/settings.xml with your username and password
```
<server>
   <id>TomcatServer</id>
   <username>admin</username>
   <password>password</password>
</server>
```
+ Install MySQL server and run query from "query.sql"
+ Download this project
```
git clone git://github.com/zzzadruga/noteslist.git
```
+ Open file hibernate-config.xml
```
booklibrary/src/main/webapp/WEB-INF/spring/hibernate-config.xml
```
+ Edit user and password for database connection
```
<property name="user" value="root" />
<property name="password" value="root" />
```
+ Go to the root project directory (noteslist)
+ Run the following maven command to download all dependent JARs and deploy project on tomcat8 server

```
mvn tomcat8:deploy
```

+ Go to the browser and enter the following URL: 
```
http://localhost:8080/noteslist
```
The port number might be different in your case. Please have a look at the tomcat log in console for that.


e-mail: zzzadruga@gmail.com
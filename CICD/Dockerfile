#Bạn sẽ sử dụng container cho java sử dụng jdk 8 để xây dựng image này.
FROM openjdk:8 

#Thiết lập các biến môi trường cho Share Note để ứng dụng có thể khởi chạy.
ENV MYSQL_HOST dtqinstancesharenote.cq4coptjwqph.ap-northeast-1.rds.amazonaws.com
ENV MYSQL_DATABASE DTQNoteDB
ENV MYSQL_USER admin
ENV MYSQL_PASSWORD <PW!!!>

#Thêm ứng dụng từ local jar file vào container.
ADD demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar

#Khởi chạy ứng dụng java với lệnh được truyền vào trên cổng truy cập là 8082
EXPOSE 8082
ENTRYPOINT ["java","-jar","demo-0.0.1-SNAPSHOT.jar"]

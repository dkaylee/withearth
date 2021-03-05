SELECT * FROM open.walking;

insert into open.walking(loc_km, about_time, start_point, end_point, walking_time, user_idx) values(1, 2, 'test1', 'test2', 12, 4);

select course_idx, loc_km from open.walking order by course_date desc limit 1; 

select * from open.walking where user_idx=1 ;

select count(*) from open.walking where user_idx=1;
;
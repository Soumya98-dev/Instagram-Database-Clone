CREATE DATABASE insta_clone;
use insta_clone;

create table users(
	id int auto_increment primary key,
    username varchar(30) unique not null,
    created_at datetime default current_timestamp
);

describe users;

create table photos(
	id int auto_increment primary key,
    image_url varchar(255) not null,
    user_id int not null,
    created_at datetime default current_timestamp,
    foreign key(user_id) references users(id)
);

create table comments(
	id int auto_increment primary key,
    comment_text varchar(2200),
    user_id int not null,
    photo_id int not null,
    created_at datetime default current_timestamp,
    foreign key(user_id) references users(id),
    foreign key(photo_id) references photos(id)
);

create table likes(
	user_id int not null,
    photo_id int not null,
    created_at datetime default current_timestamp,
    foreign key(user_id) references users(id),
    foreign key(photo_id) references photos(id),
    primary key(user_id, photo_id)
);

create table follows(
	follower_id int not null,
    followee_id int not null,
    created_at datetime default current_timestamp,
    foreign key(follower_id) references users(id),
    foreign key(followee_id) references users(id),
    primary key(follower_id, followee_id)
);

create table tags(
	id int auto_increment,
    tag_name varchar(255),
    primary key(id)
);

create table photo_tags(
	photo_id int not null,
    tag_id int not null,
    foreign key(photo_id) references photos(id),
    foreign key(tag_id) references tags(id),
    primary key(photo_id, tag_id)
);

alter table tags
add created_at datetime default current_timestamp;

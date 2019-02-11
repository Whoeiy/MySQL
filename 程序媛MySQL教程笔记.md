 2019.2.4-2.7

***

- 这个是干嘛用的？？？

  ```
  alias mysql=/usr/local/mysql/bin/mysql
  alias mysqladmin=/usr/local/mysql/bin/mysqladmin
  ```

- 在命令行中重新设置root用户的密码

  ```
  SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123456');
  ```

- 进入MySQL

  ```
  mysql -u root -p
  ```

- 创建(名为test的)数据库

  ```
  creat database test;
  ```

- 查看当前所有的数据库

  ```
  show databases;
  ```

<img src="https://ws3.sinaimg.cn/large/006tNc79ly1fzuflryy9cj30fy0eetc4.jpg" width=50% height=50%/>

- 删除数据库

  ```
  drop database test;
  ```

***

###表的操作

- 在操作表之前首先要**连接数据库**

  ```
  use test;
  ```

  出现Database changed字样表示成功

- 当忘记当前处于哪个数据库的时候，可以通过select来查看当前数据库

  ```
  select database();
  ```

  <img src="https://ws1.sinaimg.cn/large/006tNc79ly1fzugbiz395j30fq092mz4.jpg" width=75% height=50% />

- 创建表

  - ![](https://ws4.sinaimg.cn/large/006tNc79ly1fzuhgi49fkj30x806g77y.jpg)

    这里创建了一个成绩表，名为exam_score，并设置了id为**自增主键**

  - 这个命令可以展示表的结构

    ```
    show columns from exam_score;
    ```

    ![](https://ws4.sinaimg.cn/large/006tNc79ly1fzuhmffk5nj311e0bo0y5.jpg)

  - 跟数据库的操作一样，

    ```
    show tables;
    ```

    可以显示当前存在的表有哪些

    ![](https://ws3.sinaimg.cn/large/006tNc79ly1fzuholqxdgj311i0980vs.jpg)

  - 删除表的操作同理

    ```
    drop table exam_score;
    ```

***

### MySQL中如何插入数据和查找数据

- 向表中**插入数据**的格式

  ```
  insert into 表名 values 数据
  ```

  e.g.:

  ![image-20190204170303489](https://ws1.sinaimg.cn/large/006tNc79ly1g02hh91ub8j319o056djl.jpg)

- 通过下面的命令**查看表中数据**

  ```
  select * from exam_score;
  ```

  ![](https://ws3.sinaimg.cn/large/006tNc79ly1fzui4zdaf7j30v00ea43h.jpg)

- **查找数据**：获取班级内学号前两位的同学

  - 方法一

    「order by 子句」可以将任意字段当作排序的条件，它默认是按照**升序排列**的

    ```
    select * from exam_score order by id limit 0,2;
    ```

    ![](https://ws4.sinaimg.cn/large/006tNc79ly1fzui7h2wtwj30y80amjvf.jpg)

    如何**降序排列**？

    ```
    select * from 表名 order by 字段名 desc;
    ```

    升序后面接asc

  - 方法二

    ```
    select * from exam_score limit 0,2;
    ```

    ![](https://ws1.sinaimg.cn/large/006tNc79ly1fzui8vyc9cj30yc0b20wp.jpg)

- **查找数据**：获取班级里叫做“Li”的同学

  **使用where子句**

  ```
  select * from exam_score where name = 'Li';
  ```

  获取id=3的数据，同理

  ```
  select * from exam_score where id = 3;
  ```

- **查找数据**：多条件筛选数据

  ```
  select * from exam_score where name = 'Zhao' and score < 60.00;
  ```

  用and连接两个条件，表示且，用or连接，表示或。

***

### 修改和删除数据

- **修改数据**

  修改名字为“Li”的同学的成绩为65.20

  - 方法一

    ```
    update exam_score set score = 65.20 where id = 4;
    ```

    可以同时更改多个字段的数据，赋值语句中间用**逗号(,)**隔开就好。

  - 方法二：用replace来替换

    ```
    update exam_score set name = replace(name, 'Zhao'(旧值), 'Jack'（新值）) where id = 5;
    ```

- **删除数据**：

  - 删除一个数据

    ```
    delete from exam_score where id = 5;
    ```

  - 清空表中数据

    ```
    delete from 表名；
    ```

  - **【注意】**清空表数据与删除表的区别

    - delete清空操作知识数据被删除了，<u>表还存在</u>。
    - drop操作是删除了整个表，当表中存在数据时，要慎重使用这个方法。

***

#### 以上即是基本的增删改查的操作

****

2019.2.7-2.11

***

### 修改表结构

- 在考试分数表中要添加一个“其他分数”的字段，而且默认值是10

  使用**alter**命令：

  ```
  alter table exam_score add other int(4) default 10;
  ```

  ```
  格式：alter table 表名 add 字段名 数据类型 default 默认值;
  ```

  (这是什么意思？)

  ```
  desc exam_score;
  ```

- 学校决定把这个其他分数改为评价，默认值不是数字了，而是normal

  ```
  alter table exam_score change other evaluation char(20) dafault 'normal';
  ```

  ```
  格式：alter table 表名 change 旧字段 新字段的 新数据类型 default 默认值;
  如果不想修改数据类型和默认值，直接填写原先的即可
  ```

- 删除字段

  ```
  alter table exam_score drop column evaluation;
  ```

  ```
  格式：alter table 表名 drop column 字段名;
  ```

- 修改表名：将exam_score改成score

  ```
  rename table exam_score to score;
  ```

  ```
  格式：rename table 旧表名 to 新表名;
  ```

***

### MySQL进阶知识

- 将两张表关联起来

  ![](https://ws2.sinaimg.cn/large/006tNc79ly1fzz56vfshaj30le0byae2.jpg)

  ![](https://ws3.sinaimg.cn/large/006tNc79ly1fzz5788othj30kw0aigoz.jpg)

  - 等值连接inner join

    ```
    select score.id,score.name,info.phone from score inner join info on socre.name = info.name;
    ```

    ```
    select 表A.字段1,表A.字段2,表B.字段3 from 表A inner join 表B on 表A.字段2 = 表B.字段2;
    ```

    ![](https://ws3.sinaimg.cn/large/006tNc79ly1fzz5bx3a9bj30ky092mzp.jpg)

    这段命令表示通过inner join连接了score和info两个表，读取了表score中的字段id和name，和在表info中**对应的**phone字段值。

  - 左连接left join

    ![](https://ws2.sinaimg.cn/large/006tNc79ly1fzz5cescgoj30kw0c077r.jpg)

    读取表score的所有选取的字段，即使表info中没有对应的字段值。

  - 右连接right join

    ![](https://ws4.sinaimg.cn/large/006tNc79ly1fzz5keq6mej30ny0bun1d.jpg)

    读取表info中所有选取字段，即使表score中没有对应的字段值

    ![](https://ws4.sinaimg.cn/large/006tNc79ly1fzz5yez0lzj319k0e4jyj.jpg)

    换成选取info表中的name字段

    ![](https://ws4.sinaimg.cn/large/006tNc79ly1fzz65bne4wj319q0em100.jpg)

  - 总结

    ![](https://ws4.sinaimg.cn/large/006tNc79ly1fzz67pdavaj30tp0hg764.jpg)

***

### 索引

- 索引是一种单独的、物理的对数据库表中一列或多列的值进行排序的一种存储结构。
- 索引就好比数据表的目录

#### 普通索引

- 如何**添加索引**

  ```
  create index ind_score on score(name);
  ```

  ```
  格式：create index 索引名 on 表名(字段名);
  ```

  对score表中name字段创建一个索引，名为ind_score

  - 也可以在创建表的时候直接指定索引

    ![](https://ws1.sinaimg.cn/large/006tNc79ly1fzz93flsc7j30u00d4jt4.jpg)

- **查看表中索引**

  ```
  show index from score;
  ```

- **删除索引**

  ```
  drop index 索引名 on 表名;
  ```

- 通过**alter命令**创建、删除索引

  - 创建索引

    ```
    alter table 表名 add index 索引名(字段名);
    ```

  - 删除索引

    ```
    alter table 表名 drop index 索引名;
    ```

#### 唯一索引

- 创建唯一索引

  ```
  create unique index 索引名 on 表名(字段名);
  ```

  命令格式如上，大体相同，只是在index前 多一个关键字，unique

- ❓与普通索引的区别

  - 唯一索引的值必须唯一，但可以有空值
  - 其与普通索引在速度上有区别

***

### 外键

- 外键：如果一个表的某个字段指向另一个表的主键，就称之为外键

- 被指向的表，称之为**主表**，也叫**父表**

- 另一个表就是**从表**，也叫**子表**

- **设置**和**使用**一个外键

  ```
   create table article_table(
      -> article_id int(4) not null primary key auto_increment,
      -> article_title char(20) not null,
      -> author_id int(4) not null,
      -> foreign key(author_id) references author_table(author_id));
  ```

  设置外键，指向作者表的author_id字段

  ![image-20190210183324333](/Users/whoeiy/Library/Application Support/typora-user-images/image-20190210183324333.png)

  将表中的author_id字段指向author_table的主键，即设置了一个外键。

  外键约束，使得我们无法删除父表中id为4的数据，也无法在子表中添加一个id是5的数据。

- **查看**和**删除**一个表的外键

  - 查看表结构

    ```
    show create table article_table(表名);
    ```

    ![](https://ws2.sinaimg.cn/large/006tNc79ly1g01p9cq8e0j30u00uok19.jpg)

    通过这个命令我们可以看到表中存在的外键。

  - 删除表中的外键约束

    ```
    alter table article_table drop foreign key article_table_ibfk_1;
    ```

    ```
    格式：alter table 表名 drop foreign key 外键名;
    ```

    删除外键之后，就可以自由地添加、删除数据了。外键删除后不会对表中的数据有任何影响，只是改变了对表的约束。

- 通过外键给两表设置级联操作

  ![image-20190211140806208](/Users/whoeiy/Library/Application Support/typora-user-images/image-20190211140806208.png)

  用alter命令添加了另一个外键，这次又多了两个操作

  ```
  on delete cascade
  on update cascade
  ```

  **cascade**表示**关联操作**，即如果父表中数据被删除或更新，子表中对应数据也会执行同样的操作。

  像这样的关键词还有两个：

  **set null**表示子表数据不指向父表任何记录

  **restrict**表示拒绝主表的相关操作

  当不加这两句话时，默认就是restrict，这也是为什么开始主表中数据无法删除的原因。

  - 删除作者表中的一条数据，结果会是

    **执行删除操作前表中的数据**

    ![](https://ws2.sinaimg.cn/large/006tNc79ly1g02hk18587j30q80s8ain.jpg)

    **删除author_table中author_id = 4的数据**

    ```
    delete from author_table where author_id = 4; 
    ```

    **执行删除操作后表中的数据**

    ![](https://ws4.sinaimg.cn/large/006tNc79ly1g02hjt9qr6j30r00re47d.jpg)

    Article_table中对应author_id = 4的数据也跟随着被删除。

    删除了父表中的一条数据，子表中外键与之对应的数据也被删除了。

***

### 以上
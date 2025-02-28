CREATE DATABASE studentsdb;

USE studentsdb;

INSERT INTO students (last_name, first_name, middle_name, birth_date, phone, telegram, email, git) VALUES
('Иванов', 'Иван', 'Иванович', '2003-03-05', '179991112233', '@ivanov_il', 'ivanov@mail.ru', 'https://github.com/ivanovil'),
('Петров', 'Алексей', 'Сергеевич', '2004-06-12', '179992223344', '@petrov_as', 'petrov@mail.ru', 'https://github.com/petrov_as'),
('Сидоров', 'Николай', 'Андреевич', '2002-11-23', '179993344595', '@sidorov_na', 'sidorov@mail.ru', 'https://github.com/sidorov_na'),
('Кузнецов', 'Дмитрий', 'Владимирович', '2005-02-15', '179994445566', '@kuznetsov_dv', 'kuznetsov@mail.ru', 'https://github.com/kuznetsov_dv'),
('Попов', 'Владимир', 'Игоревич', '2001-09-07', '179995556677', '@popov_vl', 'popov@mail.ru', 'https://github.com/popov_vl'),
('Смирнов', 'Олег', 'Петрович', '2003-07-20', '179996667788', '@smirnov_op', 'smirnov@mail.ru', 'https://github.com/smirnov_op'),
('Васильев', 'Сергей', 'Александрович', '2002-12-01', '179997778899', '@vasiliev_as', 'vasiliev@mail.ru', 'https://github.com/vasiliev_as'),
('Михайлов', 'Антон', 'Геннадьевич', '2004-05-18', '179998889000', '@mikhailov_ag', 'mikhailov@mail.ru', 'https://github.com/mikhailov_ag'),
('Федоров', 'Алексей', 'Леонидович', '2005-08-22', '179999890011', '@fedorov_al', 'fedorov@mail.ru', 'https://github.com/fedorov_al'),
('Семенов', 'Евгений', 'Дмитриевич', '2003-01-10', '179998901122', '@semenov_ed', 'semenov@mail.ru', 'https://github.com/semenov_ed'),
('Егоров', 'Александр', 'Иванович', '2002-04-25', '179991112233', '@egorov_ai', 'egorov@mail.ru', 'https://github.com/egorov_ai'),
('Тихонов', 'Максим', 'Романович', '2005-10-30', '179992223344', '@tikhonov_mr', 'tikhonov@mail.ru', 'https://github.com/tikhonov_mr'),
('Болычев', 'Артур', 'Васильевич', '2004-02-14', '179993344595', '@bolychev_av', 'bolychev@mail.ru', 'https://github.com/bolychev_av'),
('Громов', 'Константин', 'Семенович', '2003-06-05', '179994445566', '@gromov_ks', 'gromov@mail.ru', 'https://github.com/gromov_ks'),
('Зайцев', 'Степан', 'Павлович', '2001-08-29', '179995556677', '@zaitsev_sp', 'zaitsev@mail.ru', 'https://github.com/zaitsev_sp'),
('Полов', 'Игорь', 'Денисович', '2002-12-11', '179996667788', '@polov_id', 'polov@mail.ru', 'https://github.com/polov_id'),
('Полов', 'Роман', 'Григорьевич', '2003-03-03', '179997778899', '@polov_rg', 'polov@mail.ru', 'https://github.com/polov_rg'),
('Соловьев', 'Петр', 'Олегович', '2004-07-27', '179998889000', '@solovlev_po', 'solovlev@mail.ru', 'https://github.com/solovlev_po'),
('Пригожев', 'Вячеслав', 'Федорович', '2005-05-17', '179999890011', '@prigozhev_vf', 'prigozhev@mail.ru', 'https://github.com/prigozhev_vf'),
('Крылов', 'Дмитрий', 'Николаевич', '2002-09-09', '179998901122', '@krylov_dn', 'krylov@mail.ru', 'https://github.com/krylov_dn');

SELECT * FROM students;

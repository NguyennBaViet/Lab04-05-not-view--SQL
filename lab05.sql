﻿--Bài 1:
--1.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên',SV.MaKH,NoiSinh,HocBong FROM SinhVien SV
	INNER JOIN Khoa K ON SV.MaKH = K.MaKH
	WHERE HocBong > 100000 AND NoiSinh LIKE 'Tp. HCM'

--2.
SELECT MaSV,SV.MaKH,PHAI FROM SinhVien SV
	INNER JOIN Khoa K ON SV.MaKH = K.MaKH
	WHERE TenKH LIKE N'Anh Văn' OR TenKH LIKE N'Triết'

--3.
SELECT MaSV,NgaySinh, NoiSinh,HocBong FROM SinhVien
	WHERE NgaySinh BETWEEN '19860101' AND '19920605'

--4.
SELECT MaSV,NgaySinh,Phai,MaKH FROM SinhVien
	WHERE HocBong BETWEEN 100000 AND 800000

--5.
SELECT MaMH,TenMH,Sotiet FROM MonHoc
	WHERE Sotiet BETWEEN 40 AND 60

--6.
SELECT MaSV,CONCAT(HoSV,' ', TenSV) AS N'Họ tên',Phai,IIF(PHAI=1,N'NU',N'NAM') FROM SinhVien SV
	INNER JOIN Khoa K ON SV.MaKH = K.MaKH
	WHERE TenKH LIKE N'Anh Văn' AND Phai = 0

--7.
SELECT HoSV,TenSV,NoiSinh,NgaySinh FROM SinhVien
	WHERE NoiSinh LIKE N'Hà Nội' AND NGAYSINH > '19900101'

--8.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên',Phai,IIF(PHAI=1,N'NU',N'NAM') FROM SinhVien
	WHERE PHAI = 1 AND N'Họ tên' LIKE '%N%'

--9.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên',Phai,IIF(PHAI=1,N'NU',N'NAM'),NgaySinh FROM SinhVien SV
	INNER JOIN KHOA K ON SV.MaKH = K.MaKH
	WHERE TenKH LIKE N'Tin học' AND PHAI = 0 AND NgaySinh > '19860530'

--10.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên',IIF(PHAI=1,N'NU',N'NAM') AS GIOITINH,NgaySinh FROM SinhVien

--11.
SELECT MaSV,(YEAR(GETDATE()) - YEAR(NgaySinh)) AS 'TUOI',NoiSinh,MaKH FROM SinhVien

--12.
SELECT MaSV,(YEAR(GETDATE()) - YEAR(NgaySinh)) AS N'TUỔI',NoiSinh,MaKH FROM SinhVien
	WHERE (YEAR(GETDATE()) - YEAR(NgaySinh)) BETWEEN 20 AND 30

--13.
SELECT MaSV,Phai,MaKH,HocBong,IIF(HocBong >= 500000,N'HỌC BỔNG CAO',N'HỌC BỔNG TRUNG BÌNH') AS 'MUCHB' FROM SinhVien

--14.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên',IIF(PHAI=1,N'NU',N'NAM') AS GIOITINH,TenKH  FROM SinhVien SV
	INNER JOIN Khoa K ON SV.MaKH = K.MaKH
	WHERE TenKH = N'Anh Văn'

--15.
SELECT TenKH,CONCAT(HoSV,' ', TenSV) AS N'Họ tên',TenMH,Sotiet,Diem FROM Khoa K
	INNER JOIN SinhVien SV ON K.MaKH = SV.MaKH
	INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
	INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH

--16.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên',SV.MaKH,TenMH,KQ.Diem,
	IIF(KQ.DIEM>8,N'GIỎI',IIF(KQ.DIEM>6,N'KHÁ',N'TRUNG BÌNH')) AS 'LOAI'
 FROM SinhVien SV
	INNER JOIN Khoa K ON K.MaKH = SV.MaKH
	INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
	INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH

--17.
SELECT K.MaKH,TenKH,MAX(HocBong) AS 'HOCBONGCAONHAT' FROM Khoa K
	INNER JOIN SinhVien SV ON K.MaKH = SV.MaKH
	GROUP BY K.MaKH,TenKH

--18.
SELECT MH.MaMH,TenMH,COUNT(MaSV) AS 'SOSINHVIEN' FROM MonHoc MH
	INNER JOIN Ketqua KQ ON MH.MaMH = KQ.MaMH
	GROUP BY MH.MaMH,TenMH

--19.
SELECT TOP 1 WITH TIES TenMH,Sotiet,TenSV,MAX(Diem) AS 'DIEMCAONHAT' FROM MonHoc MH
	INNER JOIN Ketqua KQ ON MH.MaMH = KQ.MaMH
	INNER JOIN SinhVien SV ON KQ.MaSV = SV.MaSV
	GROUP BY TenMH,Sotiet,TenSV ORDER BY DIEMCAONHAT DESC

--20.
SELECT TOP 1 WITH TIES K.MaKH,TenKH,COUNT(MaSV) AS 'TONGSINHVIEN' FROM Khoa K
	INNER JOIN SinhVien SV ON K.MaKH = SV.MaKH
	GROUP BY K.MaKH,TenKH ORDER BY TONGSINHVIEN DESC
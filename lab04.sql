--Bài 1:
--1. Cho biết danh sách các môn học, gồm các thông tin sau: Mã môn học, Tên môn  học, Số tiết.  
SELECT MaMH, TenMH, Sotiet FROM [dbo].[MonHoc]
GO
--2. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên,  Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên  tăng dần. 
SELECT MaSV, HoSV, TenSV, HocBong FROM [dbo].[SinhVien] ORDER BY MaSV ASC
GO
--3.Danh sách các sinh viên, gồm các thông tin sau: Mã sinh viên, Tên sinh viên,  Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự của tên.  
SELECT MaSV, TenSV, Phai, NgaySinh FROM  [dbo].[SinhVien] ORDER BY TenSV
GO
--4.Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông tin  sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần. 
SELECT  CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', NgaySinh,  HocBong FROM [dbo].[SinhVien] ORDER BY NgaySinh ASC, HOCBONG DESC
GO
--5.Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã môn,  Tên môn, Số tiết.  
SELECT MaMH, TenMH, Sotiet FROM [dbo].[MonHoc]
	WHERE TenMH LIKE 'T%'
--6.Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là i, gồm các  thông tin: Họ tên sinh viên, Ngày sinh, Phái  
SELECT  CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', Phai, NgaySinh FROM [dbo].[SinhVien]
	WHERE TENSV LIKE N'%i'
--7.Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm các  thông tin: Mã khoa, Tên khoa.  
SELECT MaKH, TenKH FROM [dbo].[Khoa]
	WHERE TENKH LIKE '_n%'
--8.Liệt kê những sinh viên mà họ có chứa chữ Thị. 
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh FROM [dbo].[SinhVien]
	WHERE HoSV LIKE N'%Thị%'
--9.Cho biết danh sách những sinh viên ký tự đầu tiên của tên nằm trong khoảng  từ a đến m, gồm các thông tin: Mã sinh viên,Họ tên sinh viên,Phái, Học bổng.  
SELECT MaSV,CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', Phai ,HocBong FROM  [dbo].[SinhVien] 
	WHERE TENSV LIKE '[a-m]%'
--10.Cho biết danh sách những sinh viên mà têncó chứa ký tự nằm trong khoảng từ  a đến m, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Nơi sinh, Học bổng.  Danh sách được sắp xếp tăng dần theo họ tên sinh viên.  
SELECT MaSV,CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', Phai ,HocBong FROM  [dbo].[SinhVien] 
	WHERE TENSV LIKE '[a-m]%' ORDER BY 2 ASC
--11. Cho biết danh sách các sinh viên của khoa Anh văn, gồm các thông tin sau: Mã  sinh viên, Họ tên sinh viên, Ngày sinh, Mã khoa.  
SELECT  MaSV,CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', NgaySinh, SV.MaKH FROM [dbo].[SinhVien] SV
	JOIN [dbo].[Khoa] KH ON SV.MaKH = KH.MaKH
	WHERE KH.TenKH = N'Anh Văn'
SELECT  MaSV,CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', NgaySinh, MaKH FROM [dbo].[SinhVien]
	WHERE MaKH IN (SELECT MaKH FROM Khoa WHERE TenKH = N'Anh Văn')
--13.Cho biết danh sách các sinh viên có học bổng lớn hơn 500,000, gồm các thông  tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ được sắp  xếp theo thứ tự Mã khoa giảm dần.  
SELECT MaSV,CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', MaKH, HocBong, DiemTrungBinh FROM SINHVIEN
	WHERE HOCBONG >= 500000
--14. Liệt kê danh sách sinh viên sinh vào ngày 20/12/1987, gồm các thông tin: Họ  tên sinh viên, Mã khoa, Học bổng.  
SELECT CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', NgaySinh, MaKH, HocBong FROM SINHVIEN
	WHERE NgaySinh = '19871220'
--15. Cho biết các sinh viên sinh sau ngày 20/12/1977, gồm các thông tin: Họ tên sinh  viên, Ngày sinh, Nơi sinh, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự  ngày sinh giảm dần.  
SELECT CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', NgaySinh, NoiSinh, HocBong FROM SINHVIEN
	WHERE NgaySinh >= '19771220' ORDER BY NgaySinh DESC
--16.Liệt kê các sinh viên có học bổng lớnhơn 100,000 và sinh ở Tp HCM, gồm các  thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.  
SELECT CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên', MaKH, NoiSinh, HocBong FROM SINHVIEN
	WHERE NOISINH LIKE N'Tp. HCM' AND HocBong >= 100000
--17.Danh sách các sinh viên của khoa Anh văn và khoa Triết, gồm các thông tin: Mã  sinh viên, Mã khoa, Phái. 
SELECT  MaSV, Phai, MaKH FROM [dbo].[SinhVien]
	WHERE MaKH LIKE '%AV%' OR MaKH LIKE '%TR%'
--18. Cho biết những sinh viên có ngày sinh từ ngày 01/01/1986 đến ngày  05/06/1992, gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học bổng.  
SELECT MaSV, NoiSinh, NgaySinh, HocBong FROM SinhVien
	WHERE NgaySinh >= '19860101' AND NGAYSINH <= '19920605'
--19. Danh sách những sinh viên có học bổng từ 200,000 đến 800,000, gồm các thông  tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.  
SELECT MaSV, NgaySinh, Phai, MaKH FROM SinhVien
	WHERE HocBong >= 100000 AND HocBong <= 800000
--20.Cho biết những môn học có số tiết lớn hơn 40 và nhỏ hơn 60, gồm các thông  tin: Mã môn học, Tên môn học, Số tiết.  
SELECT MaMH, TenMH, Sotiet FROM MonHoc
	WHERE Sotiet >= 40 AND Sotiet <= 60
--21.Liệt kê những sinh viên nam của khoa Anh văn, gồm các thông tin: Mã sinh viên,  Họ tên sinh viên, Phái.  
SELECT  MaSV,CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên',PHAI FROM SinhVien
	WHERE Phai = 0  AND MaKH LIKE '%AV%'
--22.Danh sách sinh viên có nơi sinh ở Hà Nội và ngày sinh sau ngày 01/01/1990,  gồm các thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.  
SELECT HoSV, TenSV, NoiSinh, NgaySinh FROM SinhVien
	WHERE NgaySinh > '19900101' AND NoiSinh LIKE N'Hà Nội'
--23.Liệt kê những sinh viên nữ, tên có chứa chữ N.  
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh FROM SinhVien
	WHERE Phai = 1 AND TenSV LIKE '%n%'
--24. Danh sách các nam sinh viên khoa Tin Học có ngày sinh sau ngày 30/5/1986.  
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh FROM SinhVien
	WHERE Phai = 0 AND NgaySinh > '19860530'
--25.Liệt kê danh sách sinh viên gồm các thông tin sau: Họ và tên sinh viên, Giới tính,  Ngày sinh. Trong đó Giới tính hiển thị ở dạng Nam/Nữ tuỳ theo giá trị của field  Phai là True hay False.  
SELECT CONCAT(HOSV,' ',TENSV) AS N'Họ tên sinh viên',NGAYSINH ,
	CASE PHAI WHEN 0 THEN N'Nam'
			  WHEN 1 THEN N'Nữ'
			  ELSE N'Khác' END AS PHAI
	FROM SinhVien

--26.Cho biết danh sách sinh viên gồm các thôngtin sau: Mã sinh viên, Tuổi, Nơi sinh,  Mã khoa. Trong đó Tuổi sẽ được tính bằng cách lấy năm hiện hành trừ cho năm  sinh  
SELECT MaSV, (YEAR(GETDATE()) - YEAR(NgaySinh)) AS N'Tuổi', NoiSinh, MaKH
FROM SinhVien
--27.. Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên,  Tuổi, Học bổng  
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên', (YEAR(GETDATE()) - YEAR(NgaySinh)) AS N'Tuổi', HocBong
FROM SinhVien
	WHERE N'Tuổi' >= '20'

--28.Danh sách những sinh viên có tuổi từ 20 đến 30, thông tin gồm: Họ tên sinh  viên, Tuổi, Tên khoa 
SELECT CONCAT(HoSV, ' ', TenSV) AS N'Họ tên', (YEAR(GETDATE()) - YEAR(NgaySinh)) AS TUOI,TenKH
FROM SinhVien,Khoa
	WHERE (YEAR(GETDATE()) - YEAR(NgaySinh)) BETWEEN 20 AND 30
--Bài 2
--1.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên',IIF(PHAI=1,N'Nữ',IIF(PHAI = 0,N'Nam',N'Khác')),(YEAR(GETDATE()) - YEAR(NgaySinh)) AS N'Tuổi', MaKH
FROM SinhVien ORDER BY N'Tuổi' DESC

--2.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên',Phai, NgaySinh
FROM SinhVien
	WHERE NgaySinh BETWEEN '1994-02-01' AND '1994-02-28'

--3.
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh FROM SinhVien
	ORDER BY NgaySinh DESC

--5.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên' ,Diem
FROM SinhVien,Ketqua
	ORDER BY 1,2 

--6.
SELECT CONCAT(HoSV,' ', TenSV) AS N'Họ tên',IIF(PHAI=1,N'Nữ',IIF(PHAI = 0,N'Nam',N'Khác')),TenKH
FROM SinhVien,Khoa
	WHERE TenKH LIKE N'%Anh Văn%'

--7.
SELECT TenKH, CONCAT(HoSV,' ', TenSV) AS N'Họ tên',TenMH,Sotiet,Diem
FROM SinhVien,Khoa,Ketqua,MonHoc
	WHERE TenKH LIKE N'%Tin học%'

--8.
SELECT CONCAT(SV.HoSV,' ',SV.TenSV) AS N'Họ tên',SV.MaKH, MH.TenMH ,KQ.Diem,
	IIF(KQ.Diem >8,N'Giỏi',IIF(KQ.Diem >6, N'Khá',N'Trung bình')) as LOAI
	 FROM SinhVien SV
	INNER JOIN [dbo].[Ketqua] KQ ON SV.MaSV = KQ.MaSV
	INNER JOIN [dbo].[MonHoc] MH ON KQ.MaMH = MH.MaMH
--BÀI 3
--1.
SELECT MH.MaMH,MH.TenMH,AVG (DIEM) FROM MonHoc MH
	INNER JOIN KETQUA KQ ON MH.MaMH = KQ.MaMH
	GROUP BY MH.MaMH, TenMH
--2.
SELECT CONCAT(SV.HoSV,' ',SV.TenSV) AS N'Họ tên',COUNT(MaMH) AS TONGMH FROM SinhVien SV
	INNER JOIN [dbo].[Khoa] KH ON SV.MaKH = KH.MaKH
	INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
	GROUP BY CONCAT(SV.HoSV,' ',SV.TenSV)

--3.
SELECT CONCAT(SV.HoSV,' ',SV.TenSV) AS N'Họ tên',SUM(DIEM) AS TONGDIEM FROM SinhVien SV
	INNER JOIN [dbo].[Khoa] KH ON SV.MaKH = KH.MaKH
	INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
	GROUP BY CONCAT(SV.HoSV,' ',SV.TenSV)

--4.
SELECT TenKH,COUNT(MaSV) FROM Khoa K
	INNER JOIN SinhVien SV ON K.MaKH = SV.MaKH
	GROUP BY TenKH

--5.
SELECT CONCAT(SV.HoSV,' ',SV.TenSV) AS N'Họ tên',MAX(Diem) FROM SinhVien SV
	INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
	GROUP BY CONCAT(SV.HoSV,' ',SV.TenSV)

--6.
SELECT TenMH, MAX(Sotiet) FROM MonHoc
	GROUP BY TenMH
--7.
SELECT K.MaKH,TenKH,MAX(HocBong) FROM Khoa K
	INNER JOIN SinhVien SV ON K.MaKH = SV.MaKH
	GROUP BY K.MaKH, TenKH

--8.
SELECT TenMH,MAX(Diem) AS DIEMCAONHAT FROM MonHoc MH
	INNER JOIN Ketqua KQ ON MH.MaMH = KQ.MaMH
	GROUP BY TenMH

--9.
SELECT MH.MaMH, TenMH,COUNT(SV.MaSV) AS SOSINHVIEN FROM MonHoc MH
	INNER JOIN Ketqua KQ ON MH.MaMH = KQ.MaMH
	INNER JOIN SinhVien SV ON KQ.MaSV = SV.MaSV
	GROUP BY MH.MaMH,TenMH

--10.
SELECT TOP 1 WITH TIES TenMH,Sotiet,TenSV,Diem FROM MonHoc MH
	INNER JOIN Ketqua KQ ON MH.MaMH = KQ.MaMH
	INNER JOIN SinhVien SV ON KQ.MaSV = SV.MaSV
	ORDER BY Diem DESC

--11.
SELECT TOP 1 WITH TIES K.MaKH,TenKH,COUNT(MaSV) AS TONGSOSINHVIEN FROM Khoa K
	INNER JOIN SinhVien SV ON K.MaKH = SV.MaKH
	GROUP BY K.MaKH,TenKH
	ORDER BY TONGSOSINHVIEN DESC
--12.
SELECT TOP 1 WITH TIES TenKH,CONCAT(HoSV,' ',TenSV) AS N'Họ tên sinh viên',HocBong FROM Khoa K
	INNER JOIN SinhVien SV ON SV.MaKH = K.MaKH
	GROUP BY TenKH,CONCAT(HoSV,' ',TenSV),HocBong
	ORDER BY HocBong DESC

--13.
SELECT TOP 1 WITH TIES MaSV,HoSV,TenSV,TenKH,HocBong FROM SinhVien SV
	INNER JOIN Khoa K ON SV.MaKH = K.MaKH
	WHERE TenKH LIKE N'Tin học'  ORDER BY HocBong DESC

--14.
SELECT TOP 1 WITH TIES HoSV,TenMH,Diem FROM SinhVien SV
	INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
	INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
	WHERE TenMH LIKE N'Cơ sở dữ liệu' ORDER BY Diem DESC

--15.
SELECT TOP 3 WITH TIES CONCAT(HoSV,' ',TenSV) AS N'Họ tên sinh viên',TenKH,TenMH,Diem  FROM SinhVien SV
	INNER JOIN Khoa K ON SV.MaKH = K.MaKH
	INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
	INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
	WHERE TenMH LIKE N'Đồ họa ứng dụng' ORDER BY Diem ASC
--16.
select TOP 1 WITH TIES K.MaKH,TenKH,COUNT(Phai) AS GIOITINH FROM Khoa K
	INNER JOIN SinhVien SV ON K.MaKH = SV.MaKH
	WHERE Phai LIKE 0 
	GROUP BY K.MaKH,TenKH ORDER BY GIOITINH DESC

--17.
SELECT K.MaKH,TenKH,COUNT(MaSV) AS TONGSOSINHVIEN,COUNT(PHAI) AS TONGSOSINHVIENNU  FROM Khoa K
	INNER JOIN SinhVien SV ON K.MaKH = SV.MaKH
	WHERE Phai LIKE 0
	GROUP BY K.MaKH,TenKH
--BÀI 4:SỬ DỤNG THAM SỐ TRONG TRUY VẤN
--1.
DECLARE @MAKH nvarchar(2)
SET @MAKH ='AV'
SELECT MaSV, CONCAT(HoSV,' ',TenSV) AS N'Họ tên',IIF(PHAI=1,N'Nam',N'Nữ') as GIOITINH, TenKH FROM SinhVien
	INNER JOIN Khoa ON SinhVien.MaKH = Khoa.MaKH
	WHERE Khoa.MaKH = @MAKH
GO
--2.
DECLARE @DIEM FLOAT
SET @DIEM =3.5
SELECT SV.MaSV, CONCAT(SV.HoSV,' ',SV.TenSV) AS N'Họ tên',MH.TenMH,KQ.Diem
FROM SinhVien SV
INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
INNER JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
	WHERE TenMH = N'Cơ sở dữ liệu' AND DIEM > @DIEM
GO

--3.
DECLARE @TENMH nvarchar(50)
SET @TENMH =  N'Cơ sở dữ liệu'
SELECT SV.MaSV,KH.TenKH,MH.TenMH,KQ.Diem FROM SinhVien SV
INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
INNER JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
INNER JOIN Khoa KH ON SV.MaKH = KH.MaKH
	WHERE TenMH = @TENMH
GO

--BÀI 5: TRUY VẤN CON
--1.
SELECT MaSV,MaKH, Phai FROM SinhVien
	WHERE MaSV NOT IN (SELECT MaSV FROM Ketqua)

--2.
SELECT MaSV,CONCAT(HoSV,' ',TenSV) AS N'Họ tên',MaKH  FROM SinhVien
	WHERE MaSV NOT IN (SELECT MaSV FROM Ketqua WHERE MaMH IN (SELECT MaMH FROM MonHoc WHERE TenMH =N'Cơ sở dữ liệu' ))
GO


SELECT MaSV,CONCAT(HoSV,' ',TenSV) AS N'Họ tên',MaKH  FROM SinhVien
	WHERE MaSV NOT IN (SELECT MaSV FROM Ketqua KQ
	INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
	WHERE TenMH =N'Cơ sở dữ liệu')

SELECT MaSV FROM Ketqua KQ
	INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
	WHERE TenMH =N'Cơ sở dữ liệu' 	--TÌM KIẾM MÃ SINH VIÊN ĐÃ HỌC MÔN CƠ SỞ DỮ LIỆU

--3.
SELECT MH.MaMH,TenMH,Sotiet FROM MonHoc MH
	WHERE MaMH NOT IN (SELECT MAMH FROM Ketqua)

--4.
SELECT TenKH,MaKH FROM Khoa
	WHERE MaKH NOT IN (SELECT MaKH FROM SinhVien)

--5.
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SinhVien
	WHERE MaKH IN (SELECT MaKH FROM Khoa WHERE TenKH LIKE N'Anh văn') 
			AND
	MaSV NOT IN (SELECT MaSV FROM Ketqua WHERE MaMH IN (SELECT MaMH FROM MonHoc WHERE TenMH =N'Cơ sở dữ liệu' ))

--6.
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SinhVien
	WHERE MaKH IN (SELECT MaKH FROM Khoa WHERE TenKH LIKE N'Anh văn') 
	AND
	MaSV NOT IN (SELECT MaSV FROM Ketqua WHERE MaMH IN (SELECT MaMH FROM MonHoc))

--7.
SELECT TOP 1 WITH TIES SV.MaSV,CONCAT(HoSV,' ',TenSV) AS N'Họ tên',MIN(Diem) AS DIEMMIN INTO #DMIN FROM SINHVIEN SV
	INNER JOIN Khoa K ON SV.MaKH = K.MaKH
	INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
	INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
	WHERE TENMH LIKE N'Đồ họa ứng dụng' AND TenKH LIKE N'Tin học'
	GROUP BY SV.MaSV,CONCAT(HoSV,' ',TenSV) ORDER BY DIEMMIN 
SELECT SV.MaSV,CONCAT(HoSV,' ',TenSV) AS N'Họ tên',Diem FROM SinhVien SV
	INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
	INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
	INNER JOIN #DMIN M ON SV.MaSV = M.MASV AND Diem < DIEMMIN
--9.
SELECT * FROM SinhVien
	WHERE MaKH IN (SELECT MaKH FROM Khoa WHERE TenKH LIKE N'Kế toán')
SELECT SUM(HOCBONG) FROM SinhVien WHERE MaKH IN (SELECT MaKH FROM Khoa WHERE TenKH LIKE N'Kế toán')
SELECT * FROM SinhVien WHERE HocBong > (SELECT SUM(HOCBONG) FROM SinhVien WHERE MaKH IN (SELECT MaKH FROM Khoa WHERE TenKH LIKE N'Kế toán'))
--10.
--TÌM KIẾM NƠI TINH CỦA SINH VIÊN CÓ HỌC BỔNG LỚN NHẤT KHOA ANH VĂN
SELECT TOP 1 MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh FROM SinhVien
	WHERE MaKH IN (SELECT MaKH FROM Khoa WHERE TenKH LIKE N'Anh văn') 
	 ORDER BY HocBong DESC
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh FROM SinhVien
	WHERE NoiSinh IN (SELECT TOP 1  NoiSinh FROM SinhVien
	WHERE MaKH IN (SELECT MaKH FROM Khoa WHERE TenKH LIKE N'Anh văn') 
	 ORDER BY HocBong DESC)




SELECT TOP 1 MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh INTO #TMP FROM SinhVien
	WHERE MaKH IN (SELECT MaKH FROM Khoa WHERE TenKH LIKE N'Anh văn') 
	 ORDER BY HocBong DESC
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh FROM SinhVien
	WHERE NoiSinh IN (SELECT NoiSinh FROM #TMP)

--11.
--DANH SÁCH ĐIỂM CAO NHẤT VỚI MỖI MÔN
SELECT MH.MaMH,TenMH,MAX(Diem) AS DiemMax INTO #TMP1 FROM MonHoc MH 
	INNER JOIN Ketqua KQ ON MH.MaMH = KQ.MaMH
	GROUP BY MH.MaMH,TenMH

SELECT SV.MaSV,CONCAT(HoSV,' ',TenSV) AS N'Họ tên',MH.TenMH,Diem FROM SinhVien SV
	INNER JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
	INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
	INNER JOIN #TMP1 TMP ON MH.MaMH = TMP.MaMH AND TMP.DiemMax = Diem
	ORDER BY TenMH

--12.
--HỌC BỔNG CAO NHẤT THEO TỪNG KHOA
SELECT TenKH,K.MaKH,MAX(HocBong) AS HOCBONGCAONHAT INTO #TMP2 FROM Khoa K
	INNER JOIN SinhVien SV ON K.MaKH = SV.MaKH
	GROUP BY K.MaKH,TenKH
SELECT SV.MaSV,K.TenKH,HocBong FROM SinhVien SV
	INNER JOIN Khoa K ON SV.MaKH = K.MaKH
	INNER JOIN #TMP2 TMP ON K.TenKH = TMP.TenKH AND HOCBONGCAONHAT = HocBong
	
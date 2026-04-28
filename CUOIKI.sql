CREATE DATABASE QuanLyKho_HeThong;
GO
USE QuanLyKho_HeThong;
GO


IF OBJECT_ID('ChiTietPhieuXuat', 'U') IS NOT NULL DROP TABLE ChiTietPhieuXuat;
IF OBJECT_ID('ChiTietPhieuNhap', 'U') IS NOT NULL DROP TABLE ChiTietPhieuNhap;
IF OBJECT_ID('PhieuXuat', 'U') IS NOT NULL DROP TABLE PhieuXuat;
IF OBJECT_ID('PhieuNhap', 'U') IS NOT NULL DROP TABLE PhieuNhap;
IF OBJECT_ID('KhachHang', 'U') IS NOT NULL DROP TABLE KhachHang;
IF OBJECT_ID('HangHoa', 'U') IS NOT NULL DROP TABLE HangHoa;
GO

-- =================================================
-- 1. TẠO BẢNG & RÀNG BUỘC
-- =================================================
CREATE TABLE HangHoa (
    MaHang VARCHAR(20) PRIMARY KEY,
    TenHang NVARCHAR(100) NOT NULL,
    NoiSanXuat NVARCHAR(100),
    SoLuongTon INT DEFAULT 0
);

CREATE TABLE KhachHang (
    MaKH VARCHAR(20) PRIMARY KEY,
    TenKH NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(200),
    SoDienThoai VARCHAR(15)
);

CREATE TABLE PhieuNhap (
    SoPhieuNhap VARCHAR(20) PRIMARY KEY,
    NgayNhap DATE DEFAULT GETDATE()
);

CREATE TABLE ChiTietPhieuNhap (
    SoPhieuNhap VARCHAR(20) FOREIGN KEY REFERENCES PhieuNhap(SoPhieuNhap),
    MaHang VARCHAR(20) FOREIGN KEY REFERENCES HangHoa(MaHang),
    SoLuongNhap INT CHECK (SoLuongNhap > 0),
    DonGiaNhap DECIMAL(18,2),
    PRIMARY KEY (SoPhieuNhap, MaHang)
);

CREATE TABLE PhieuXuat (
    SoPhieuXuat VARCHAR(20) PRIMARY KEY,
    NgayXuat DATE DEFAULT GETDATE(),
    MaKH VARCHAR(20) FOREIGN KEY REFERENCES KhachHang(MaKH)
);

CREATE TABLE ChiTietPhieuXuat (
    SoPhieuXuat VARCHAR(20) FOREIGN KEY REFERENCES PhieuXuat(SoPhieuXuat),
    MaHang VARCHAR(20) FOREIGN KEY REFERENCES HangHoa(MaHang),
    SoLuongXuat INT CHECK (SoLuongXuat > 0),
    DonGiaXuat DECIMAL(18,2),
    PRIMARY KEY (SoPhieuXuat, MaHang)
);
GO


DELETE FROM ChiTietPhieuXuat;
DELETE FROM PhieuXuat;
DELETE FROM ChiTietPhieuNhap;
DELETE FROM PhieuNhap;
DELETE FROM KhachHang;
DELETE FROM HangHoa;
GO
-- =================================================
-- 2. CHÈN 20 HÀNG HÓA
-- =================================================
INSERT INTO HangHoa (MaHang, TenHang, NoiSanXuat, SoLuongTon) VALUES 
('H01', N'Gạo Tám Thơm', N'Thái Bình', 1012), ('H02', N'Dầu Ăn Neptune', N'Hải Phòng', 230),
('H03', N'Đường Biên Hòa', N'Đồng Nai', 221), ('H04', N'Sữa Vinamilk', N'Nghệ An', 420),
('H05', N'Mì Hảo Hảo', N'Bình Dương', 4200), ('H06', N'Nước mắm Phú Quốc', N'Kiên Giang', 906),
('H07', N'Tương ớt Cholimex', N'Long An', 856), ('H08', N'Muối i-ốt', N'Bạc Liêu', 305),
('H09', N'Bột giặt Omo', N'TP.HCM', 92), ('H10', N'Dầu gội Dove', N'Hà Nội', 853),
('H11', N'Kem đánh răng PS', N'TP.HCM', 62), ('H12', N'Xà phòng Lux', N'Thái Lan', 320),
('H13', N'Cà phê Trung Nguyên', N'Đắk Lắk', 0), ('H14', N'Trà Thái Nguyên', N'Thái Nguyên', 220),
('H15', N'Bánh Quy Cosy', N'Hưng Yên',1932), ('H16', N'Nước rửa chén Sunlight', N'Vĩnh Phúc', 404),
('H17', N'Khăn giấy Blessyou', N'Đà Nẵng', 0), ('H18', N'Nước lau sàn Gift', N'Bình Dương', 111),
('H19', N'Sữa tắm Enchanteur', N'TP.HCM', 0), ('H20', N'Gạo ST25', N'Sóc Trăng', 2549);

-- Chèn 20 Khách hàng
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, SoDienThoai) VALUES 
('K01', N'Đại lý Tiến Phát', N'Hà Nội', '0987654321'), ('K02', N'WinMart Thanh Xuân', N'Hà Nội', '0966555444'), ('K03', N'Cửa hàng Sơn Tây', N'Hà Nội', '0345667788'), ('K04', N'Công ty Alpha', N'Hà Nội', '0243111222'), ('K05', N'Tạp hóa số 5', N'Hà Nội', '0911222333'),
('K06', N'Siêu thị Co.op', N'TP.HCM', '0901234567'), ('K07', N'Bách Hóa Xanh', N'TP.HCM', '0945456456'), ('K08', N'Siêu thị Lotte', N'TP.HCM', '0283777888'),
('K09', N'Đại lý Hùng Anh', N'Đà Nẵng', '0905999888'), ('K10', N'Cửa hàng Gia Bảo', N'Đà Nẵng', '0363554433'), ('K11', N'Tạp hóa An Nhiên', N'Đà Nẵng', '0263333444'), ('K12', N'Thực phẩm Sạch', N'Đà Nẵng', '0254333111'),
('K13', N'Tùng Lộc Port', N'Hải Phòng', '0933222111'), ('K14', N'Đại lý Đất Cảng', N'Hải Phòng', '0904111222'), ('K15', N'Cửa hàng Lê Chân', N'Hải Phòng', '0225333444'), ('K16', N'XNK Hải Phòng', N'Hải Phòng', '0225666777'),
('K17', N'Cố Đô Store', N'Huế', '0234111222'), ('K18', N'Đại lý Hương Giang', N'Huế', '0234888999'),
('K19', N'Đại lý Phương Nam', N'Cần Thơ', '0292333444'), ('K20', N'Mai Lan Mekong', N'Cần Thơ', '0383777666');

-- 4. CHÈN 20 PHIẾU NHẬP
INSERT INTO PhieuNhap (SoPhieuNhap, NgayNhap) VALUES 
('PN01', '2026-04-01'), ('PN02', '2026-04-02'), ('PN03', '2026-04-03'), ('PN04', '2026-04-04'),
('PN05', '2026-04-05'), ('PN06', '2026-04-06'), ('PN07', '2026-04-07'), ('PN08', '2026-04-08'),
('PN09', '2026-04-09'), ('PN10', '2026-04-10'), ('PN11', '2026-04-11'), ('PN12', '2026-04-12'),
('PN13', '2026-04-13'), ('PN14', '2026-04-14'), ('PN15', '2026-04-15'), ('PN16', '2026-04-16'),
('PN17', '2026-04-17'), ('PN18', '2026-04-18'), ('PN19', '2026-04-19'), ('PN20', '2026-04-20');

-- =================================================
-- 5. CHÈN 20 CHI TIẾT PHIẾU NHẬP (Số lượng lớn để đủ tồn kho)
-- =================================================
INSERT INTO ChiTietPhieuNhap (SoPhieuNhap, MaHang, SoLuongNhap, DonGiaNhap) VALUES 
('PN01','H01',1000,15000), ('PN02','H02',500,28000), ('PN03','H03',300,18000), ('PN04','H04',400,7500),
('PN05','H05',2000,3500), ('PN06','H06',100,155000), ('PN07','H07',250,12000), ('PN08','H08',600,5000),
('PN09','H09',150,185000), ('PN10','H10',120,125000), ('PN11','H11',500,26000), ('PN12','H12',300,16000),
('PN13','H13',100,245000), ('PN14','H14',200,82000), ('PN15','H15',450,48000), ('PN16','H16',500,33000),
('PN17','H17',1000,14000), ('PN18','H18',350,29000), ('PN19','H19',100,138000), ('PN20','H20',800,36000);

-- =================================================
-- 6. CHÈN 20 PHIẾU XUẤT
-- =================================================
INSERT INTO PhieuXuat (SoPhieuXuat, NgayXuat, MaKH) VALUES 
('PX01', '2026-04-21', 'K01'), ('PX02', '2026-04-21', 'K02'), ('PX03', '2026-04-22', 'K03'), ('PX04', '2026-04-22', 'K04'),
('PX05', '2026-04-23', 'K05'), ('PX06', '2026-04-23', 'K06'), ('PX07', '2026-04-24', 'K07'), ('PX08', '2026-04-24', 'K08'),
('PX09', '2026-04-25', 'K09'), ('PX10', '2026-04-25', 'K10'), ('PX11', '2026-04-26', 'K11'), ('PX12', '2026-04-26', 'K12'),
('PX13', '2026-04-27', 'K13'), ('PX14', '2026-04-27', 'K14'), ('PX15', '2026-04-28', 'K15'), ('PX16', '2026-04-28', 'K16'),
('PX17', '2026-04-28', 'K17'), ('PX18', '2026-04-28', 'K18'), ('PX19', '2026-04-28', 'K19'), ('PX20', '2026-04-28', 'K20');

-- =================================================
-- 7. CHÈN 20 CHI TIẾT PHIẾU XUẤT (Số lượng nhỏ hơn nhập)
-- =================================================
INSERT INTO ChiTietPhieuXuat (SoPhieuXuat, MaHang, SoLuongXuat, DonGiaXuat) VALUES 
('PX01','H01',150,18000), ('PX02','H02',80,32000), ('PX03','H03',50,22000), ('PX04','H04',100,9500),
('PX05','H05',500,4500), ('PX06','H06',10,185000), ('PX07','H07',40,15000), ('PX08','H08',100,7500),
('PX09','H09',20,220000), ('PX10','H10',15,155000), ('PX11','H11',80,32000), ('PX12','H12',60,21000),
('PX13','H13',12,310000), ('PX14','H14',25,98000), ('PX15','H15',70,58000), ('PX16','H16',90,42000),
('PX17','H17',200,18000), ('PX18','H18',40,38000), ('PX19','H19',15,175000), ('PX20','H20',120,44000);
GO
--Truy vấn cơ bản
-- Lấy danh sách tất cả hàng hóa trong kho
SELECT * FROM HangHoa;

-- Lấy danh sách khách hàng ở Hà Nội
SELECT * FROM KhachHang WHERE DiaChi = N'Hà Nội';

-- Xem danh sách các phiếu nhập hàng
SELECT * FROM PhieuNhap ORDER BY NgayNhap DESC;


--TRUY VẤN THỐNG KÊ, NHÓM, TỔNG HỢP

-- Thống kê số lượng khách hàng theo từng khu vực
SELECT DiaChi, COUNT(MaKH) AS SoLuongKhach
FROM KhachHang
GROUP BY DiaChi;

-- Thống kê tổng số lượng nhập của từng mặt hàng
SELECT MaHang, SUM(SoLuongNhap) AS TongNhap
FROM ChiTietPhieuNhap
GROUP BY MaHang;

-- Tìm mặt hàng có số lượng tồn kho cao nhất
SELECT TOP 1 TenHang, SoLuongTon 
FROM HangHoa 
ORDER BY SoLuongTon DESC;


--VIEW
GO 

-- View 1: Báo cáo tồn kho chi tiết
GO
CREATE OR ALTER VIEW View_BaoCaoTonKho AS 
SELECT MaHang, TenHang, SoLuongTon, NoiSanXuat FROM HangHoa;
GO

SELECT * FROM View_BaoCaoTonKho;
GO


-- View 2: Doanh thu theo từng khách hàng
CREATE OR ALTER VIEW View_DoanhThuKhachHang AS
SELECT k.MaKH, k.TenKH, SUM(ctx.SoLuongXuat * ctx.DonGiaXuat) AS TongTienMua
FROM KhachHang k 
JOIN PhieuXuat px ON k.MaKH = px.MaKH
JOIN ChiTietPhieuXuat ctx ON px.SoPhieuXuat = ctx.SoPhieuXuat
GROUP BY k.MaKH, k.TenKH;
GO

SELECT * FROM View_DoanhThuKhachHang;
GO


-- View 3: Danh sách các mặt hàng nhập trong ngày
CREATE OR ALTER VIEW View_NhapTrongNgay AS
SELECT h.TenHang, ctx.SoLuongNhap, pn.NgayNhap
FROM ChiTietPhieuNhap ctx
JOIN PhieuNhap pn ON ctx.SoPhieuNhap = pn.SoPhieuNhap
JOIN HangHoa h ON ctx.MaHang = h.MaHang
GO

SELECT * FROM View_NhapTrongNgay;
GO

--3 stored proceduce


-- Proc 1: Tìm kiếm hàng hóa theo tên (Truyền tham số)
GO
CREATE OR ALTER PROC sp_TimKiemHangHoa @TenH NVARCHAR(100)
AS BEGIN
    SELECT MaHang, TenHang, SoLuongTon, NoiSanXuat 
    FROM HangHoa 
    WHERE TenHang LIKE '%' + @TenH + '%';
END;
GO
-- Thực thi Proc 1: Tìm các mặt hàng có chữ 'Gạo'
EXEC sp_TimKiemHangHoa @TenH = N'Gạo';
GO


-- Proc 2: Cập nhật số điện thoại khách hàng và hiện lại danh sách
CREATE OR ALTER PROC sp_CapNhatSDT @Ma VARCHAR(20), @SDT VARCHAR(15)
AS BEGIN
    UPDATE KhachHang SET SoDienThoai = @SDT WHERE MaKH = @Ma;
    -- Hiện lại khách hàng đó để kiểm tra kết quả
    SELECT MaKH, TenKH, DiaChi, SoDienThoai FROM KhachHang WHERE MaKH = @Ma;
END;
GO
-- Thực thi Proc 2: Đổi số điện thoại khách K01
EXEC sp_CapNhatSDT @Ma = 'K01', @SDT = '0123456789';
GO


-- Proc 3: Thống kê chi tiết các lần nhập của 1 mã hàng
CREATE OR ALTER PROC sp_ThongKeNhapChiTiet @MaH VARCHAR(20)
AS BEGIN
    SELECT 
        ctx.MaHang, 
        h.TenHang, 
        ctx.SoLuongNhap, 
        CAST(pn.NgayNhap AS DATE) AS NgayNhap
    FROM ChiTietPhieuNhap ctx
    JOIN PhieuNhap pn ON ctx.SoPhieuNhap = pn.SoPhieuNhap
    JOIN HangHoa h ON ctx.MaHang = h.MaHang
    WHERE ctx.MaHang = @MaH;
END;
GO
-- Thực thi Proc 3: Xem lịch sử nhập của mã hàng 'H01'
EXEC sp_ThongKeNhapChiTiet @MaH = 'H01';
GO


--Function

-- Func 1: Tính thành tiền (Số lượng * Đơn giá)
GO
CREATE OR ALTER FUNCTION fn_TinhThanhTien (@SL INT, @Gia DECIMAL(18,2))
RETURNS DECIMAL(18,2) AS BEGIN RETURN @SL * @Gia END;
GO
--bảng Func 1: Tính tiền cho các mặt hàng trong ChiTietPhieuXuat
SELECT 
    SoPhieuXuat, 
    MaHang, 
    SoLuongXuat, 
    DonGiaXuat, 
    dbo.fn_TinhThanhTien(SoLuongXuat, DonGiaXuat) AS ThanhTien 
FROM ChiTietPhieuXuat;
GO


-- Func 2: Lấy tên hàng từ mã hàng
CREATE OR ALTER FUNCTION fn_LayTenHang (@MaH VARCHAR(20))
RETURNS NVARCHAR(100) AS BEGIN RETURN (SELECT TenHang FROM HangHoa WHERE MaHang = @MaH) END;
GO
-- bảng Func 2: Hiện danh sách phiếu nhập kèm tên hàng (Lấy qua Func)
SELECT 
    SoPhieuNhap, 
    MaHang, 
    dbo.fn_LayTenHang(MaHang) AS TenHang_GoiTuFunc,
    SoLuongNhap
FROM ChiTietPhieuNhap;
GO


-- Func 3: Tính tổng giá trị tồn kho (Số lượng tồn * Đơn giá nhập cuối cùng)
CREATE OR ALTER FUNCTION fn_GiaTriTon (@MaH VARCHAR(20))
RETURNS DECIMAL(18,2) AS BEGIN 
    RETURN (SELECT SoLuongTon * (SELECT TOP 1 DonGiaNhap FROM ChiTietPhieuNhap WHERE MaHang = @MaH ORDER BY SoPhieuNhap DESC) 
    FROM HangHoa WHERE MaHang = @MaH)
END;
GO
-- bảng Func 3: Báo cáo giá trị kho của tất cả mặt hàng
SELECT 
    MaHang, 
    TenHang, 
    SoLuongTon, 
    dbo.fn_GiaTriTon(MaHang) AS TongGiaTriTon
FROM HangHoa;
GO


--TRIGGER



-- Trigger 1: Tự động cộng SoLuongTon khi Nhập hàng
GO
CREATE OR ALTER TRIGGER trg_CongKho ON ChiTietPhieuNhap AFTER INSERT AS
BEGIN
    UPDATE h
    SET h.SoLuongTon = h.SoLuongTon + i.SoLuongNhap
    FROM HangHoa h 
    JOIN inserted i ON h.MaHang = i.MaHang;
END;
GO

-- Lệnh kiểm tra Trigger 1: H01
SELECT MaHang, TenHang, SoLuongTon FROM HangHoa WHERE MaHang = 'H01';

--Chèn thử 1 phiếu nhập mới cho H01 (Thêm 500 cái)
INSERT INTO PhieuNhap (SoPhieuNhap, NgayNhap) VALUES ('PN_TEST', GETDATE());
INSERT INTO ChiTietPhieuNhap (SoPhieuNhap, MaHang, SoLuongNhap, DonGiaNhap) 
VALUES ('PN_TEST', 'H01', 500, 15000);

--Xem lại bảng hanghoa
SELECT MaHang, TenHang, SoLuongTon FROM HangHoa WHERE MaHang = 'H01';
GO


-- Trigger 2: Kiểm tra tồn kho và trừ SoLuongTon khi Xuất hàng
CREATE OR ALTER TRIGGER trg_TruKho ON ChiTietPhieuXuat FOR INSERT AS
BEGIN
    -- Kiểm tra xem kho có đủ hàng không
    IF EXISTS (
        SELECT 1 FROM inserted i 
        JOIN HangHoa h ON i.MaHang = h.MaHang 
        WHERE h.SoLuongTon < i.SoLuongXuat
    )
    BEGIN
        RAISERROR(N'Lỗi: Số lượng trong kho không đủ để xuất hàng!', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        -- đủ thì trừ kho
        UPDATE h
        SET h.SoLuongTon = h.SoLuongTon - i.SoLuongXuat
        FROM HangHoa h 
        JOIN inserted i ON h.MaHang = i.MaHang;
    END
END;
GO

-- Lệnh kiểm tra Trigger 2: H02
SELECT MaHang, TenHang, SoLuongTon FROM HangHoa WHERE MaHang = 'H02';

-- Chèn thử phiếu xuất (Xuất đi 20 cái)
INSERT INTO PhieuXuat (SoPhieuXuat, NgayXuat, MaKH) VALUES ('PX_TEST', GETDATE(), 'K01');
INSERT INTO ChiTietPhieuXuat (SoPhieuXuat, MaHang, SoLuongXuat, DonGiaXuat) 
VALUES ('PX_TEST', 'H02', 20, 32000);

-- xem lại hanghoa
SELECT MaHang, TenHang, SoLuongTon FROM HangHoa WHERE MaHang = 'H02';
GO
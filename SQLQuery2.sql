USE QuanLyKho_HeThong;
GO
---((( 2 người làm ))) --- Tạo database, tạo bảng(có dữ liệu demo từ 20 bản ghi trở lên cho mỗi bảng)
    
-- Xóa bảng cũ để làm mới hoàn toàn
DROP TABLE IF EXISTS ChiTietPhieuXuat;
DROP TABLE IF EXISTS ChiTietPhieuNhap;
DROP TABLE IF EXISTS PhieuXuat;
DROP TABLE IF EXISTS PhieuNhap;
DROP TABLE IF EXISTS KhachHang;
DROP TABLE IF EXISTS HangHoa;
GO

-- 1. Bảng Hàng Hóa
CREATE TABLE HangHoa (
    MaHang VARCHAR(20) PRIMARY KEY,
    TenHang NVARCHAR(100) NOT NULL,
    NoiSanXuat NVARCHAR(100),
    SoLuongTon INT DEFAULT 0
);

-- 2. Bảng Khách Hàng
CREATE TABLE KhachHang (
    MaKH VARCHAR(20) PRIMARY KEY,
    TenKH NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(200),
    SoDienThoai VARCHAR(15)
);

-- 3. Bảng Phiếu Nhập
CREATE TABLE PhieuNhap (
    SoPhieuNhap VARCHAR(20) PRIMARY KEY,
    NgayNhap DATETIME DEFAULT GETDATE()
);

-- 4. Chi tiết Phiếu Nhập
CREATE TABLE ChiTietPhieuNhap (
    SoPhieuNhap VARCHAR(20) FOREIGN KEY REFERENCES PhieuNhap(SoPhieuNhap),
    MaHang VARCHAR(20) FOREIGN KEY REFERENCES HangHoa(MaHang),
    SoLuongNhap INT CHECK (SoLuongNhap > 0),
    DonGiaNhap DECIMAL(18,2),
    PRIMARY KEY (SoPhieuNhap, MaHang)
);

-- 5. Bảng Phiếu Xuất
CREATE TABLE PhieuXuat (
    SoPhieuXuat VARCHAR(20) PRIMARY KEY,
    NgayXuat DATETIME DEFAULT GETDATE(),
    MaKH VARCHAR(20) FOREIGN KEY REFERENCES KhachHang(MaKH)
);

-- 6. Chi tiết Phiếu Xuất
CREATE TABLE ChiTietPhieuXuat (
    SoPhieuXuat VARCHAR(20) FOREIGN KEY REFERENCES PhieuXuat(SoPhieuXuat),
    MaHang VARCHAR(20) FOREIGN KEY REFERENCES HangHoa(MaHang),
    SoLuongXuat INT CHECK (SoLuongXuat > 0),
    DonGiaXuat DECIMAL(18,2),
    PRIMARY KEY (SoPhieuXuat, MaHang)
);
GO

-- =============================================
-- CHÈN DỮ LIỆU DEMO (MỖI BẢNG 20 DÒNG)
-- =============================================

-- Hàng hóa (20 món)
INSERT INTO HangHoa (MaHang, TenHang, NoiSanXuat, SoLuongTon) VALUES 
('H01', N'Gạo Tám Thơm', N'Thái Bình', 500), ('H02', N'Dầu Ăn Neptune', N'Hải Phòng', 150),
('H03', N'Đường Biên Hòa', N'Đồng Nai', 100), ('H04', N'Sữa Vinamilk', N'Nghệ An', 200),
('H05', N'Mì Hảo Hảo', N'Bình Dương', 1000), ('H06', N'Nước mắm Phú Quốc', N'Kiên Giang', 80),
('MH07', N'Tương ớt Cholimex', N'Long An', 120), ('MH08', N'Muối i-ốt', N'Bạc Liêu', 300),
('MH09', N'Bột giặt Omo', N'TP.HCM', 60), ('MH10', N'Dầu gội Dove', N'Hà Nội', 45),
('MH11', N'Kem đánh răng PS', N'TP.HCM', 210), ('MH12', N'Xà phòng Lux', N'Thái Lan', 140),
('MH13', N'Cà phê Trung Nguyên', N'Đắk Lắk', 350), ('MH14', N'Trà Thái Nguyên', N'Thái Nguyên', 90),
('MH15', N'Bánh Quy Cosy', N'Hưng Yên', 180), ('MH16', N'Nước rửa chén Sunlight', N'Vĩnh Phúc', 220),
('MH17', N'Khăn giấy Blessyou', N'Đà Nẵng', 500), ('MH18', N'Nước lau sàn Gift', N'Bình Dương', 110),
('MH19', N'Sữa tắm Enchanteur', N'TP.HCM', 75), ('MH20', N'Gạo ST25', N'Sóc Trăng', 400);

-- Khách hàng (20 người)
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, SoDienThoai) VALUES 
('K01', N'Cửa hàng Minh Khuê', N'Quận 1, TP.HCM', '0901234567'), ('K02', N'Đại lý Tiến Phát', N'Hoàn Kiếm, Hà Nội', '0987654321'),
('K03', N'Siêu thị Co.op', N'Quận 3, TP.HCM', '0912123123'), ('K04', N'Bách Hóa Xanh', N'Bình Thạnh, TP.HCM', '0945456456'),
('K05', N'Đại lý Hùng Anh', N'Hải Châu, Đà Nẵng', '0905999888'), ('K06', N'Cửa hàng Mai Lan', N'TP. Vinh', '0383777666'),
('K07', N'Công ty Alpha', N'Nam Từ Liêm, Hà Nội', '0243111222'), ('K08', N'Đại lý Phương Nam', N'Cần Thơ', '0292333444'),
('K09', N'Siêu thị WinMart', N'Thanh Xuân, Hà Nội', '0966555444'), ('K10', N'Cửa hàng Tùng Lộc', N'Hải Phòng', '0933222111'),
('K11', N'Tạp hóa Cô Chín', N'Bắc Ninh', '0977112233'), ('K12', N'Đại lý Việt Hà', N'Nha Trang', '0583445566'),
('K13', N'Cửa hàng Sơn Tây', N'Sơn Tây, Hà Nội', '0345667788'), ('K14', N'Đại lý Miền Tây', N'Long An', '0272334455'),
('K15', N'Siêu thị Lotte', N'Quận 7, TP.HCM', '0283777888'), ('K16', N'Cửa hàng Gia Bảo', N'Thái Bình', '0363554433'),
('K17', N'Tạp hóa An Nhiên', N'Đà Lạt', '0263333444'), ('K18', N'Đại lý Kim khí', N'Biên Hòa', '0251333444'),
('K19', N'Công ty Hưng Thịnh', N'Bình Dương', '0274333222'), ('K20', N'Cửa hàng thực phẩm Sạch', N'Vũng Tàu', '0254333111');

-- Phiếu nhập (20 phiếu) & Phiếu xuất (20 phiếu)
-- TRUY VẤN CƠ BẢN & THỐNG KÊ
-- 1. Lập danh sách các mặt hàng và số lượng đang còn trong kho
SELECT MaHang, TenHang, SoLuongTon FROM HangHoa;

-- 2. Tìm kiếm mặt hàng theo tên hàng, ngày nhập hoặc nơi sản xuất
SELECT DISTINCT h.MaHang, h.TenHang, h.NoiSanXuat
FROM HangHoa h
JOIN ChiTietPhieuNhap ctn ON h.MaHang = ctn.MaHang
JOIN PhieuNhap pn ON ctn.SoPhieuNhap = pn.SoPhieuNhap
WHERE h.TenHang LIKE N'%Tên_Hàng%' 
   OR h.NoiSanXuat = N'%Nơi_Sản_Xuất%'
   OR pn.NgayNhap = '2026-04-17';

-- 3. Tìm kiếm các mặt hàng xuất theo ngày, tháng, năm cụ thể
SELECT h.TenHang, ctx.SoLuongXuat, px.NgayXuat
FROM ChiTietPhieuXuat ctx
JOIN PhieuXuat px ON ctx.SoPhieuXuat = px.SoPhieuXuat
JOIN HangHoa h ON ctx.MaHang = h.MaHang
WHERE px.NgayXuat = '2026-04-17';

-- 4. Lập danh sách các mặt hàng tồn kho với số lượng > 100
SELECT * FROM HangHoa WHERE SoLuongTon > 100;

-- 5. Doanh thu bán ra theo tháng/năm của từng loại mặt hàng
SELECT h.TenHang, MONTH(px.NgayXuat) AS Thang, YEAR(px.NgayXuat) AS Nam,
       SUM(ctx.SoLuongXuat * ctx.DonGiaXuat) AS DoanhThu
FROM ChiTietPhieuXuat ctx
JOIN PhieuXuat px ON ctx.SoPhieuXuat = px.SoPhieuXuat
JOIN HangHoa h ON ctx.MaHang = h.MaHang
GROUP BY h.TenHang, MONTH(px.NgayXuat), YEAR(px.NgayXuat);

-- 6. Mặt hàng có số lượng nhập/xuất lớn nhất (Top 1)
SELECT TOP 1 MaHang, SUM(SoLuongNhap) AS TongNhap FROM ChiTietPhieuNhap GROUP BY MaHang ORDER BY TongNhap DESC;
SELECT TOP 1 MaHang, SUM(SoLuongXuat) AS TongXuat FROM ChiTietPhieuXuat GROUP BY MaHang ORDER BY TongXuat DESC;

-- 7. Danh sách các mặt hàng không bán được trong tháng hiện tại
SELECT MaHang, TenHang FROM HangHoa
WHERE MaHang NOT IN (
    SELECT DISTINCT ctx.MaHang 
    FROM ChiTietPhieuXuat ctx 
    JOIN PhieuXuat px ON ctx.SoPhieuXuat = px.SoPhieuXuat
    WHERE MONTH(px.NgayXuat) = MONTH(GETDATE()) AND YEAR(px.NgayXuat) = YEAR(GETDATE())
);


-- THỰC HIỆN 03 VIEW (Tối ưu theo yêu cầu doanh nghiệp)

-- View 1: Danh sách hàng đang tồn kho thực tế và nơi sản xuất
CREATE VIEW View_TonKhoHienTai AS
SELECT MaHang, TenHang, SoLuongTon, NoiSanXuat 
FROM HangHoa;
GO

-- View 2: Báo cáo doanh thu chi tiết theo tháng và năm
CREATE VIEW View_DoanhThuTheoThang AS
SELECT MONTH(px.NgayXuat) AS Thang, YEAR(px.NgayXuat) AS Nam, 
       SUM(ctx.SoLuongXuat * ctx.DonGiaXuat) AS TongDoanhThu
FROM PhieuXuat px 
JOIN ChiTietPhieuXuat ctx ON px.SoPhieuXuat = ctx.SoPhieuXuat
GROUP BY MONTH(px.NgayXuat), YEAR(px.NgayXuat);
GO

-- View 3: Thống kê tổng hợp Nhập - Xuất của từng mặt hàng
CREATE VIEW View_ThongKeXuatNhap AS
SELECT h.MaHang, h.TenHang, 
       ISNULL((SELECT SUM(SoLuongNhap) FROM ChiTietPhieuNhap WHERE MaHang = h.MaHang), 0) AS TongNhap,
       ISNULL((SELECT SUM(SoLuongXuat) FROM ChiTietPhieuXuat WHERE MaHang = h.MaHang), 0) AS TongXuat
FROM HangHoa h;
GO

---((( 1 người làm ))) -- Stored Procedure và Function

-- THỰC HIỆN 03 STORED PROCEDURE
-- Proc 1: Tìm kiếm hàng theo nơi sản xuất
CREATE PROC sp_TimHangTheoNoiSX @NoiSX NVARCHAR(100)
AS SELECT * FROM HangHoa WHERE NoiSanXuat LIKE '%' + @NoiSX + '%';
GO

-- Proc 2: Thống kê các mặt hàng xuất theo ngày cụ thể
CREATE PROC sp_HangXuatTheoNgay @Ngay DATE
AS 
SELECT h.TenHang, ctx.SoLuongXuat, ctx.DonGiaXuat
FROM ChiTietPhieuXuat ctx JOIN PhieuXuat px ON ctx.SoPhieuXuat = px.SoPhieuXuat
JOIN HangHoa h ON ctx.MaHang = h.MaHang
WHERE CAST(px.NgayXuat AS DATE) = @Ngay;
GO

-- Proc 3: Cập nhật số điện thoại khách hàng
CREATE PROC sp_CapNhatSDT @MaKH VARCHAR(20), @SDT_Moi VARCHAR(15)
AS UPDATE KhachHang SET SoDienThoai = @SDT_Moi WHERE MaKH = @MaKH;
GO

-- THỰC HIỆN 03 FUNCTION
-- Func 1: Tính thành tiền của một dòng xuất (SL * Đơn giá)
CREATE FUNCTION fn_ThanhTien (@SL INT, @Gia DECIMAL(18,2))
RETURNS DECIMAL(18,2) AS BEGIN RETURN @SL * @Gia END;
GO

-- Func 2: Lấy tên hàng dựa vào mã hàng
CREATE FUNCTION fn_GetTenHang (@MaH VARCHAR(20))
RETURNS NVARCHAR(100) AS BEGIN RETURN (SELECT TenHang FROM HangHoa WHERE MaHang = @MaH) END;
GO

-- Func 3: Tính tổng số lượng đã nhập của một mã hàng
CREATE FUNCTION fn_TongNhapMH (@MaH VARCHAR(20))
RETURNS INT AS BEGIN RETURN (SELECT SUM(SoLuongNhap) FROM ChiTietPhieuNhap WHERE MaHang = @MaH) END;
GO


---((( 1 người làm ))) --- Trigger và Nhận xét
-- THỰC HIỆN 02 TRIGGER
-- Trigger 1: Tự động cập nhật tăng SoLuongTon khi có Phiếu Nhập mới
CREATE TRIGGER trg_CapNhatNhap ON ChiTietPhieuNhap AFTER INSERT AS
BEGIN
    UPDATE HangHoa
    SET SoLuongTon = SoLuongTon + (SELECT SoLuongNhap FROM inserted)
    WHERE MaHang = (SELECT MaHang FROM inserted);
END;
GO

-- Trigger 2: Kiểm tra tồn kho trước khi xuất và trừ SoLuongTon
CREATE TRIGGER trg_CapNhatXuat ON ChiTietPhieuXuat FOR INSERT AS
BEGIN
    DECLARE @MaH VARCHAR(20) = (SELECT MaHang FROM inserted);
    DECLARE @SLXuat INT = (SELECT SoLuongXuat FROM inserted);
    DECLARE @SLTon INT = (SELECT SoLuongTon FROM HangHoa WHERE MaHang = @MaH);

    IF @SLXuat > @SLTon
    BEGIN
        PRINT N'Lỗi: Số lượng trong kho không đủ để xuất!';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        UPDATE HangHoa SET SoLuongTon = SoLuongTon - @SLXuat WHERE MaHang = @MaH;
    END
END;
GO

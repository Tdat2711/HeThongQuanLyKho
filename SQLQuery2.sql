USE QuanLyKho_HeThong;
GO

-- Xóa bảng cũ nếu đã tồn tại (chạy theo thứ tự này để tránh lỗi khóa ngoại)
DROP TABLE IF EXISTS ChiTietPhieuXuat;
DROP TABLE IF EXISTS ChiTietPhieuNhap;
DROP TABLE IF EXISTS PhieuXuất;
DROP TABLE IF EXISTS PhieuNhap;
DROP TABLE IF EXISTS KhachHang;
DROP TABLE IF EXISTS HangHoa;
GO

-- Sau đó mới dán đoạn code CREATE TABLE vào phía dưới...


USE QuanLyKho_HeThong;
GO

-- 1. Bảng Danh mục Hàng Hóa
CREATE TABLE HangHoa (
    MaHang VARCHAR(20) PRIMARY KEY,
    TenHang NVARCHAR(100) NOT NULL,
    NoiSanXuat NVARCHAR(100),
    SoLuongTon INT DEFAULT 0 -- Sẽ cập nhật khi nhập/xuất
);

-- 2. Bảng Khách Hàng
CREATE TABLE KhachHang (
    MaKH VARCHAR(20) PRIMARY KEY,
    TenKH NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(200),
    SoDienThoai VARCHAR(15)
);

-- 3. Bảng Phiếu Nhập (Thông tin chung)
CREATE TABLE PhieuNhap (
    SoPhieuNhap VARCHAR(20) PRIMARY KEY,
    NgayNhap DATETIME DEFAULT GETDATE()
);

-- 4. Chi tiết Phiếu Nhập (Một phiếu nhập nhiều mặt hàng)
CREATE TABLE ChiTietPhieuNhap (
    SoPhieuNhap VARCHAR(20) FOREIGN KEY REFERENCES PhieuNhap(SoPhieuNhap),
    MaHang VARCHAR(20) FOREIGN KEY REFERENCES HangHoa(MaHang),
    SoLuongNhap INT CHECK (SoLuongNhap > 0),
    DonGiaNhap DECIMAL(18,2),
    PRIMARY KEY (SoPhieuNhap, MaHang)
);

-- 5. Bảng Phiếu Xuất (Thông tin chung)
CREATE TABLE PhieuXuất (
    SoPhieuXuat VARCHAR(20) PRIMARY KEY,
    NgayXuat DATETIME DEFAULT GETDATE(),
    MaKH VARCHAR(20) FOREIGN KEY REFERENCES KhachHang(MaKH)
);

-- 6. Chi tiết Phiếu Xuất (Một phiếu xuất nhiều mặt hàng)
CREATE TABLE ChiTietPhieuXuat (
    SoPhieuXuat VARCHAR(20) FOREIGN KEY REFERENCES PhieuXuất(SoPhieuXuat),
    MaHang VARCHAR(20) FOREIGN KEY REFERENCES HangHoa(MaHang),
    SoLuongXuat INT CHECK (SoLuongXuat > 0),
    DonGiaXuat DECIMAL(18,2),
    PRIMARY KEY (SoPhieuXuat, MaHang)
);
GO

USE QuanLyKho_HeThong;
GO

-- 1. Thêm mặt hàng mẫu (Nếu chưa có)
INSERT INTO HangHoa VALUES ('H01', N'Gạo Tám Thơm', N'Thái Bình', 500);
INSERT INTO HangHoa VALUES ('H02', N'Dầu Ăn Neptune', N'Hải Phòng', 50);
INSERT INTO HangHoa VALUES ('H03', N'Đường Biên Hòa', N'Đồng Nai', 150);

-- 2. Thêm khách hàng
INSERT INTO KhachHang VALUES ('K01', N'Cửa hàng Minh Khuê', N'Quận 1, TP.HCM', '0901234567');
INSERT INTO KhachHang VALUES ('K02', N'Đại lý Tiến Phát', N'Hoàn Kiếm, Hà Nội', '0987654321');

-- 3. Tạo phiếu nhập (Nhập hàng về kho)
INSERT INTO PhieuNhap VALUES ('PN001', '2026-03-01');
INSERT INTO ChiTietPhieuNhap VALUES ('PN001', 'H01', 1000, 15000); -- Nhập 1000kg Gạo
INSERT INTO ChiTietPhieuNhap VALUES ('PN001', 'H02', 100, 45000);  -- Nhập 100 chai Dầu

-- 4. Tạo phiếu xuất (Bán cho khách)
INSERT INTO PhieuXuất VALUES ('PX001', '2026-03-15', 'K01');
INSERT INTO ChiTietPhieuXuat VALUES ('PX001', 'H01', 200, 18000); -- Xuất 200kg Gạo cho KH01
GO

CREATE DATABASE cafe_pbo;

CREATE TABLE kategori (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL
);


CREATE TABLE barang (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_barang VARCHAR(100) NOT NULL,
    ukuran INT NOT NULL,
    kategori_id INT NOT NULL,
    stok INT NOT NULL,
    FOREIGN KEY (kategori_id) REFERENCES kategori(id)
);

CREATE TABLE penjualan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_barang INT NOT NULL,
    qty INT NOT NULL,
    harga_barang DECIMAL(10, 2) NOT NULL,
    total_harga DECIMAL(10, 2) GENERATED ALWAYS AS (qty * harga_barang) STORED,
    tanggal DATETIME NOT NULL,
    FOREIGN KEY (id_barang) REFERENCES barang(id)
);




INSERT INTO detail_penjualan (id, id_penjualan, id_menu, qty, harga_barang, total_harga, tanggal)
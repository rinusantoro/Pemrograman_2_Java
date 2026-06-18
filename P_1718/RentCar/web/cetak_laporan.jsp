<%@page import="java.sql.*"%>
<%@page import="com.itextpdf.text.*"%>
<%@page import="com.itextpdf.text.pdf.*"%>
<%@page import="config.Koneksi"%>

<%
response.setContentType("application/pdf");
response.setHeader("Content-Disposition",
        "attachment; filename=laporan_rentcar.pdf");

Document document = new Document();
PdfWriter.getInstance(document, response.getOutputStream());
document.open();

/* =========================
   JUDUL
========================= */
Font titleFont = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
Paragraph title = new Paragraph("LAPORAN RENT CAR\n\n", titleFont);
title.setAlignment(Element.ALIGN_CENTER);
document.add(title);

/* =========================
   KONEKSI
========================= */
Connection conn = new Koneksi().getKoneksi();
Statement st = conn.createStatement();

/* =========================
   LAPORAN PENYEWAAN
========================= */
document.add(new Paragraph("Laporan Penyewaan\n\n"));

PdfPTable tableSewa = new PdfPTable(6);

tableSewa.addCell("ID Sewa");
tableSewa.addCell("Tanggal");
tableSewa.addCell("Customer");
tableSewa.addCell("Mobil");
tableSewa.addCell("Lama");
tableSewa.addCell("Total");

ResultSet rs = st.executeQuery("SELECT * FROM penyewaan");

while(rs.next()){
    tableSewa.addCell(rs.getString("id_sewa"));
    tableSewa.addCell(rs.getString("tanggal_sewa"));
    tableSewa.addCell(rs.getString("id_customer"));
    tableSewa.addCell(rs.getString("id_mobil"));
    tableSewa.addCell(rs.getString("lama_sewa") + " Hari");
    tableSewa.addCell("Rp " + rs.getDouble("total_bayar"));
}

document.add(tableSewa);

/* =========================
   SPASI
========================= */
document.add(new Paragraph("\n\n"));

/* =========================
   LAPORAN PENGEMBALIAN
========================= */
document.add(new Paragraph("Laporan Pengembalian\n\n"));

PdfPTable tableKembali = new PdfPTable(5);

tableKembali.addCell("ID Kembali");
tableKembali.addCell("ID Sewa");
tableKembali.addCell("Tanggal");
tableKembali.addCell("Denda");
tableKembali.addCell("Total");

rs = st.executeQuery("SELECT * FROM pengembalian");

while(rs.next()){
    tableKembali.addCell(rs.getString("id_kembali"));
    tableKembali.addCell(rs.getString("id_sewa"));
    tableKembali.addCell(rs.getString("tanggal_kembali"));
    tableKembali.addCell("Rp " + rs.getDouble("denda"));
    tableKembali.addCell("Rp " + rs.getDouble("total_bayar"));
}

document.add(tableKembali);

/* =========================
   SELESAI
========================= */
document.close();
%>

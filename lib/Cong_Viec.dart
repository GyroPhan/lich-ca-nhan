
class Cong_Viec {
  String cvTen;
  final String cvKhoangCach;
  final String cvNgay;
  final String cvMau;

  // 1
//  Cong_Viec({this.cvTen, this.cvKhoangCach, this.cvNgay, this.cvMau});
  // 2
//  Cong_Viec(this.cvTen, this.cvKhoangCach, this.cvNgay, this.cvMau); // tai sao co luc can cai nay co luc ko
  // tuy` y' m =))) Hoac ket hop
  // Ham khoi tao la ham chay. dau tien khi m tao. no' . Vd m mun new 1 cai Cong_Viec thi khi m new no se chay vao ham nay trc

  // 3
  Cong_Viec(this.cvTen, {this.cvKhoangCach, this.cvNgay, this.cvMau}); // tai sao co luc can cai nay co luc ko

  // Co {} voi ko co {} khac nhau cho nao :
  // 1/ co' {} thi no se hien ra cai ten + ko bat buoc phai them vao khi khoi tao
  // 2/ ko co {} thi no ko hien + bat buoc phai them vao khi khoi tao
}
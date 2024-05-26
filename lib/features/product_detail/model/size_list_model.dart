class SizeList {
  final String sizeId;
  final int sizes;

  SizeList({
    required this.sizeId,
    required this.sizes,
  });
}

List<SizeList> sizeList = [
  SizeList(sizeId: "s1", sizes: 36),
  SizeList(sizeId: "s2", sizes: 37),
  SizeList(sizeId: "s3", sizes: 38),
  SizeList(sizeId: "s4", sizes: 39),
  SizeList(sizeId: "s5", sizes: 40),
];

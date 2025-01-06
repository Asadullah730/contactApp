class Contact {
  String ?name  = '';
  String ?number = '';
  bool is_favorite ;

  Contact ({
    required this.name ,
    required this.number,
    this.is_favorite = false,
  });
}

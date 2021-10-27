abstract class IServices{
  Future<void> cadastrarUser();
  Future<void> loginUser();
  Future deslogar();
  Future getDataUser();
}
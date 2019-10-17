enum ViewState {
  idle, busy, empty, error, unAuthorized
}

class UnAuthorizedException implements Exception {
  const UnAuthorizedException();

  @override
  String toString() => 'UnAuthorizedException';
}

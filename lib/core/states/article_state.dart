sealed class ArticleState<T> {

}

class ArticleInitial<T> extends ArticleState<T> {
  
}

class ArticleLoading<T> extends ArticleState<T> {
  
}

class ArticleSuccess<T> extends ArticleState<T> {
  final T article;

  ArticleSuccess({required this.article});
}


class ArticleError<T> extends ArticleState<T> {
  final String error;

  ArticleError({required this.error});

}
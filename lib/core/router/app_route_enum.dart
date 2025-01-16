enum AppRouteEnum {
  postsPage,
  commentsPage,
}

  extension AppRouteEnumEx on AppRouteEnum{
    String get name{
      switch (this){
        
        case AppRouteEnum.postsPage:
          return 'posts';
        case AppRouteEnum.commentsPage:
          return 'comments';
      }
    }
  }
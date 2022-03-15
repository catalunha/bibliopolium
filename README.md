# libros legere

Gerenciamento de livros da Ricelly


# Models


```Dart
class Community{
    final String id;
    final String name;
    final String estado;
    final String cidade;
    final UserRef coordinator;
    final String? email;
    final String? codeCC;
    final String? description;
    final bool isActive;
}
class CommunityRef{
    final String id;
    final String name;
    final String estado;
    final String cidade;
}
class User{
    final String id;
    final String uid;
    final String email;
    final String? displayName;
    final String? photoUrl;
    final List<String> level;//admin,distributor,sells(pessoa que vende),buys(pessoa que compra)
    final String? cellPhone;
    final String? address;
    final String? cep;
    final List<CommunityRef>? communityList;
    final DateTime createdAt;
    final bool isActive;
}
class UserRef{
    final String id;
    final String email;
    final String? displayName;
    final String? photoUrl;
    final String? cellPhone;
}

class Book{
    final String id;
    final String title;
    final List<AuthorRef> authorRefList;
    final Publishing publishingRef;
    final String? edition;
    final String? isbn;
    final List<String>? photosUrl;
    final bool isActive;
}
class Author{
    final String id;
    final String name;
    final String? photoUrl;
    final String? description;
    final bool isActive;
}
class AuthorRef{
    final String id;
    final String name;
    final String? photoUrl;
}

class Publishing{
    final String id;
    final String name;
    final String? estado;
    final String? cidade;
    final String? email;
    final String? site;
    final String? cellPhone;
    final String? description;
    final bool isActive;
}
class PublishingRef{
    final String id;
    final String name;
}
class BookShelf{
    final String id;
    final String communityId;
    final Book book;
    final int value;
    final int discount;
    final List<String>? copyForSale;
    final List<String>? copyReserved;
    final List<String>? copySold;
    final bool isActive;
}
class BookShelfRef{
    final String id;
    final String bookTitle;
    final List<AuthorRef> bookAuthorRefList;
    final Publishing bookPublishingRef;
    final String? bookPhotoUrl;
}
class Order{
    final String id;
    final User userRef;
    final BookShelfRef bookShelfRef;
    final bool isWish;
    final int? value;
    final String? copy;
    final bool? isPaid;//yes=copyForSale/copyReserved->copySold. no=copyForSale->copyReserved
    final String? paymentUrl;
    final bool? isDelivered;
    final String? description;
    final DateTime createdAt;
    final bool isActive;//false=return book to shelf
}

```


# Create
flutter create --project-name=bibliopolium --org education.brintec --platforms android,web -a kotlin ./bibliopolium

flutter create --project-name=marcelosilva --org education.brintec --platforms android,web -a kotlin ./marcelosilva
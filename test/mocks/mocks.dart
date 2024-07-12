import 'package:flutter/material.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class Mocks {
  static MediaProductEntity get mediaProductEntityMock => MediaProductEntity(
        id: 1,
        adult: false,
        title: "Interestelar",
        posterPath: "/nCbkOyOMTEwlEV0LtCOvCnwEONA.jpg",
        backdropPath: null,
        releaseDate: DateTime.now(),
        voteAverage: 8.437,
        voteCount: 34694,
        overview:
            "As reservas naturais da Terra estão chegando ao fim e um grupo de astronautas recebe a missão de verificar possíveis planetas para receberem a população mundial, possibilitando a continuação da espécie. Cooper é chamado para liderar o grupo e aceita a missão sabendo que pode nunca mais ver os filhos. Ao lado de Brand, Jenkins e Doyle, ele seguirá em busca de um novo lar.",
        genreIds: const [12, 18, 878],
        popularity: 146.311,
        isLoading: false,
        backgroundColor: Colors.black,
        ligthColor: Colors.white,
        details: detailsEntityMock,
      );

  static MediaProductModel get mediaProductModelMock => MediaProductModel(
        id: 1,
        adult: false,
        title: "Interestelar",
        posterPath: "/nCbkOyOMTEwlEV0LtCOvCnwEONA.jpg",
        backdropPath: null,
        releaseDate: DateTime.now(),
        voteAverage: 8.437,
        voteCount: 34694,
        overview:
            "As reservas naturais da Terra estão chegando ao fim e um grupo de astronautas recebe a missão de verificar possíveis planetas para receberem a população mundial, possibilitando a continuação da espécie. Cooper é chamado para liderar o grupo e aceita a missão sabendo que pode nunca mais ver os filhos. Ao lado de Brand, Jenkins e Doyle, ele seguirá em busca de um novo lar.",
        genreIds: const [12, 18, 878],
        popularity: 146.311,
      );

  static TrendingEntity get trendingEntityMock => TrendingEntity(
        day: [mediaProductEntityMock],
        week: [mediaProductEntityMock],
      );

  static TrendingModel get trendingModelMock => TrendingModel(
        day: [mediaProductModelMock],
        week: [mediaProductModelMock],
      );

  static PopularEntity get popularEntityMock => PopularEntity(
        movies: [mediaProductEntityMock],
        series: [mediaProductEntityMock],
      );

  static PopularModel get popularModelMock => PopularModel(
        movies: [mediaProductModelMock],
        series: [mediaProductModelMock],
      );

  static DetailsEntity get detailsEntityMock => const DetailsEntity(
        credits: CreditsEntity(
          cast: [
            CastEntity(
              name: "Matthew McConaughey",
              character: "Cooper",
              profilePath: "/hvXoqAKI958higegGERDLKaLhj8.jpg",
            ),
          ],
        ),
        videos: ResultsVideoEntity(
          results: [
            VideoEntity(
              name: "Interestelar - Trailer Oficial 2 (leg) [HD]",
              key: "BYUZhddDbdc",
              site: "YouTube",
              type: "Trailer",
            ),
          ],
        ),
        tagline: "O fim da terra não será o nosso fim.",
        genres: [
          {"id": 12, "name": "Aventura"},
          {"id": 18, "name": "Drama"},
          {"id": 878, "name": "Ficção científica"}
        ],
      );

  static DetailsModel get detailsModelMock => const DetailsModel(
        credits: CreditsModel(
          cast: [
            CastModel(
              name: "Matthew McConaughey",
              character: "Cooper",
              profilePath: "/hvXoqAKI958higegGERDLKaLhj8.jpg",
            ),
          ],
        ),
        videos: ResultsVideoModel(
          results: [
            VideoModel(
              name: "Interestelar - Trailer Oficial 2 (leg) [HD]",
              key: "BYUZhddDbdc",
              site: "YouTube",
              type: "Trailer",
            ),
          ],
        ),
        tagline: "O fim da terra não será o nosso fim.",
        genres: [
          {"id": 12, "name": "Aventura"},
          {"id": 18, "name": "Drama"},
          {"id": 878, "name": "Ficção científica"}
        ],
      );

  static Map<String, dynamic> get treadingToJsonMock => {
        "page": 1,
        "results": [
          {
            "backdrop_path": "/fqv8v6AycXKsivp1T5yKtLbGXce.jpg",
            "id": 653346,
            "title": "Planeta dos Macacos: O Reinado",
            "original_title": "Kingdom of the Planet of the Apes",
            "overview":
                "Várias gerações no futuro, após o reinado de César, os macacos são agora a espécie dominante e vivem harmoniosamente, enquanto os humanos foram reduzidos a viver nas sombras. À medida que um novo líder símio tirânico constrói o seu império, um jovem macaco empreende uma jornada angustiante que o levará a questionar tudo o que sabia sobre o passado e a fazer escolhas que definirão um futuro tanto para os macacos como para os humanos.",
            "poster_path": "/dzDK2TMXsxrolGVdZwNGcOlZqrF.jpg",
            "media_type": "movie",
            "adult": false,
            "original_language": "en",
            "genre_ids": [878, 12, 28],
            "popularity": 2650.607,
            "release_date": "2024-05-08",
            "video": false,
            "vote_average": 7.012,
            "vote_count": 1555
          }
        ],
        "total_pages": 1,
        "total_results": 1
      };

  static Map<String, dynamic> get popularToJsonMock => {
        "page": 1,
        "results": [
          {
            "adult": false,
            "backdrop_path": "/stKGOm8UyhuLPR9sZLjs5AkmncA.jpg",
            "genre_ids": [16, 10751, 12, 35, 18],
            "id": 1022789,
            "original_language": "en",
            "original_title": "Inside Out 2",
            "overview":
                "\"Divertida Mente 2\", da Disney e da Pixar, retorna à mente da adolescente Riley, e o faz no momento em que a sala de comando está passando por uma demolição repentina para dar lugar a algo totalmente inesperado: novas emoções! Alegria, Tristeza, Raiva, Medo e Nojinho não sabem bem como reagir quando Ansiedade aparece, e tudo indica que ela não está sozinha.",
            "popularity": 8656.535,
            "poster_path": "/9h2KgGXSmWigNTn3kQdEFFngj9i.jpg",
            "release_date": "2024-06-11",
            "title": "Divertida Mente 2",
            "video": false,
            "vote_average": 7.715,
            "vote_count": 1594
          },
        ],
        "total_pages": 1,
        "total_results": 1
      };

  static Map<String, dynamic> get upcomingsToJsonMock => {
        "dates": {"maximum": "2024-08-07", "minimum": "2024-07-17"},
        "page": 1,
        "results": [
          {
            "adult": false,
            "backdrop_path": "/P82NAcEsLIYgQtrtn36tYsj41m.jpg",
            "genre_ids": [16, 35, 10751, 12],
            "id": 748783,
            "original_language": "en",
            "original_title": "The Garfield Movie",
            "overview":
                "Garfield, o mundialmente famoso gato de interior que odeia segundas-feiras e adora lasanha, está prestes a ter uma aventura selvagem ao ar livre! Depois de um reencontro inesperado com seu pai há muito perdido – o desalinhado gato de rua Vic – Garfield e seu amigo canino Odie são forçados a deixar sua vida perfeitamente mimada para se juntarem a Vic em um assalto hilariante e de alto risco.",
            "popularity": 1109.646,
            "poster_path": "/eJhCZ3pPjNLKxdNezjrQaQsfENP.jpg",
            "release_date": "2024-04-30",
            "title": "Garfield - Fora de Casa",
            "video": false,
            "vote_average": 7.091,
            "vote_count": 287
          },
        ],
        "total_pages": 1,
        "total_results": 1
      };

  static Map<String, dynamic> get searchToJsonMock => {
        "dates": {"maximum": "2024-08-07", "minimum": "2024-07-17"},
        "page": 1,
        "results": [
          {
            "adult": false,
            "backdrop_path": "/gRApXuxWmO2forYTuTmcz5RaNUV.jpg",
            "genre_ids": [28, 80, 53, 35],
            "id": 573435,
            "original_language": "en",
            "original_title": "Bad Boys: Ride or Die",
            "overview":
                "Depois que seu falecido ex-capitão é incriminado, Lowrey e Burnett tentam limpar seu nome, apenas para acabarem se tornando os mais procurados de Miami.",
            "popularity": 1332.888,
            "poster_path": "/ak6VZDHms5T4p0eFISk336kqjR6.jpg",
            "release_date": "2024-06-05",
            "title": "Bad Boys: Até o Fim",
            "video": false,
            "vote_average": 7.014,
            "vote_count": 533
          },
        ],
        "total_pages": 1,
        "total_results": 1
      };

  static Map<String, dynamic> get detailsToJsonMock => {
        "adult": false,
        "backdrop_path": "/xJHokMbljvjADYdit5fK5VQsXEG.jpg",
        "belongs_to_collection": null,
        "budget": 165000000,
        "genres": [
          {"id": 12, "name": "Aventura"},
          {"id": 18, "name": "Drama"},
          {"id": 878, "name": "Ficção científica"}
        ],
        "homepage": "https://www.warnerbros.co.uk/movies/interstellar",
        "id": 157336,
        "imdb_id": "tt0816692",
        "origin_country": ["US"],
        "original_language": "en",
        "original_title": "Interstellar",
        "overview":
            "As reservas naturais da Terra estão chegando ao fim e um grupo de astronautas recebe a missão de verificar possíveis planetas para receberem a população mundial, possibilitando a continuação da espécie. Cooper é chamado para liderar o grupo e aceita a missão sabendo que pode nunca mais ver os filhos. Ao lado de Brand, Jenkins e Doyle, ele seguirá em busca de um novo lar.",
        "popularity": 146.311,
        "poster_path": "/nCbkOyOMTEwlEV0LtCOvCnwEONA.jpg",
        "production_companies": [
          {
            "id": 923,
            "logo_path": "/8M99Dkt23MjQMTTWukq4m5XsEuo.png",
            "name": "Legendary Pictures",
            "origin_country": "US"
          },
          {
            "id": 9996,
            "logo_path": "/3tvBqYsBhxWeHlu62SIJ1el93O7.png",
            "name": "Syncopy",
            "origin_country": "GB"
          },
          {
            "id": 13769,
            "logo_path": null,
            "name": "Lynda Obst Productions",
            "origin_country": ""
          }
        ],
        "production_countries": [
          {"iso_3166_1": "GB", "name": "United Kingdom"},
          {"iso_3166_1": "US", "name": "United States of America"}
        ],
        "release_date": "2014-11-05",
        "revenue": 701729206,
        "runtime": 169,
        "spoken_languages": [
          {"english_name": "English", "iso_639_1": "en", "name": "English"}
        ],
        "status": "Released",
        "tagline": "O fim da terra não será o nosso fim.",
        "title": "Interestelar",
        "video": false,
        "vote_average": 8.437,
        "vote_count": 34694,
        "videos": {
          "results": [
            {
              "iso_639_1": "pt",
              "iso_3166_1": "BR",
              "name": "Interestelar - Trailer Oficial 2 (leg) [HD]",
              "key": "BYUZhddDbdc",
              "published_at": "2014-05-23T13:00:07.000Z",
              "site": "YouTube",
              "size": 720,
              "type": "Trailer",
              "official": true,
              "id": "57d212fdc3a3687b140005f1"
            },
            {
              "iso_639_1": "pt",
              "iso_3166_1": "BR",
              "name": "Interestelar - Trailer Oficial 1 (leg) [HD]",
              "key": "hHBsKHVLAYc",
              "site": "YouTube",
              "size": 1080,
              "type": "Trailer",
              "official": true,
              "published_at": "2013-12-20T13:21:32.000Z",
              "id": "65b0ba84a3144001935a971c"
            }
          ]
        },
        "credits": {
          "cast": [
            {
              "adult": false,
              "gender": 2,
              "id": 10297,
              "known_for_department": "Acting",
              "name": "Matthew McConaughey",
              "original_name": "Matthew McConaughey",
              "popularity": 38.068,
              "profile_path": "/sY2mwpafcwqyYS1sOySu1MENDse.jpg",
              "cast_id": 9,
              "character": "Cooper",
              "credit_id": "52fe4bbf9251416c910e47cb",
              "order": 0
            },
            {
              "adult": false,
              "gender": 1,
              "id": 1813,
              "known_for_department": "Acting",
              "name": "Anne Hathaway",
              "original_name": "Anne Hathaway",
              "popularity": 99.711,
              "profile_path": "/g5qceKcjNnOm9XaXdWoBQ01CG5g.jpg",
              "cast_id": 169,
              "character": "Brand",
              "credit_id": "57fe146fc3a368504a00261e",
              "order": 1
            },
            {
              "adult": false,
              "gender": 2,
              "id": 3895,
              "known_for_department": "Acting",
              "name": "Michael Caine",
              "original_name": "Michael Caine",
              "popularity": 31.719,
              "profile_path": "/bVZRMlpjTAO2pJK6v90buFgVbSW.jpg",
              "cast_id": 18,
              "character": "Professor Brand",
              "credit_id": "52fe4bbf9251416c910e47f5",
              "order": 2
            },
            {
              "adult": false,
              "gender": 1,
              "id": 83002,
              "known_for_department": "Acting",
              "name": "Jessica Chastain",
              "original_name": "Jessica Chastain",
              "popularity": 31.559,
              "profile_path": "/bXFXSlfCzoE5Py7KBP9P0Y0Ot1v.jpg",
              "cast_id": 17,
              "character": "Murph",
              "credit_id": "52fe4bbf9251416c910e47f1",
              "order": 3
            },
            {
              "adult": false,
              "gender": 2,
              "id": 1893,
              "known_for_department": "Acting",
              "name": "Casey Affleck",
              "original_name": "Casey Affleck",
              "popularity": 25.131,
              "profile_path": "/lzRsKNAo5LuqvcroaD2FuOmk0T3.jpg",
              "cast_id": 21,
              "character": "Tom",
              "credit_id": "52fe4bbf9251416c910e4805",
              "order": 4
            },
            {
              "adult": false,
              "gender": 2,
              "id": 8210,
              "known_for_department": "Acting",
              "name": "Wes Bentley",
              "original_name": "Wes Bentley",
              "popularity": 26.734,
              "profile_path": "/qwFi0SsOqm7feN4ps7cAiQDTNHL.jpg",
              "cast_id": 28,
              "character": "Doyle",
              "credit_id": "52fe4bbf9251416c910e4821",
              "order": 5
            },
            {
              "adult": false,
              "gender": 2,
              "id": 17052,
              "known_for_department": "Acting",
              "name": "Topher Grace",
              "original_name": "Topher Grace",
              "popularity": 21.227,
              "profile_path": "/hvXoqAKI958higegGERDLKaLhj8.jpg",
              "cast_id": 27,
              "character": "Getty",
              "credit_id": "52fe4bbf9251416c910e481d",
              "order": 6
            },
          ],
          "crew": [
            {
              "adult": false,
              "gender": 2,
              "id": 1334782,
              "known_for_department": "Art",
              "name": "Josh Lusby",
              "original_name": "Josh Lusby",
              "popularity": 2.693,
              "profile_path": null,
              "credit_id": "54cba7c392514157cc01098b",
              "department": "Art",
              "job": "Art Direction"
            },
            {
              "adult": false,
              "gender": 0,
              "id": 991724,
              "known_for_department": "Art",
              "name": "Eggert Ketilsson",
              "original_name": "Eggert Ketilsson",
              "popularity": 1.002,
              "profile_path": null,
              "credit_id": "54cba770c3a3680924010431",
              "department": "Art",
              "job": "Art Direction"
            },
            {
              "adult": false,
              "gender": 0,
              "id": 1328137,
              "known_for_department": "Art",
              "name": "Kendelle Elliott",
              "original_name": "Kendelle Elliott",
              "popularity": 3.066,
              "profile_path": null,
              "credit_id": "54cba75b925141678e014d1a",
              "department": "Art",
              "job": "Art Direction"
            },
            {
              "adult": false,
              "gender": 2,
              "id": 14349,
              "known_for_department": "Art",
              "name": "David F. Klassen",
              "original_name": "David F. Klassen",
              "popularity": 2.625,
              "profile_path": null,
              "credit_id": "54cba799925141678e014d20",
              "department": "Art",
              "job": "Art Direction"
            },
            {
              "adult": false,
              "gender": 0,
              "id": 21718,
              "known_for_department": "Art",
              "name": "Gary Kosko",
              "original_name": "Gary Kosko",
              "popularity": 5.331,
              "profile_path": null,
              "credit_id": "54cba7acc3a36854a9003043",
              "department": "Art",
              "job": "Art Direction"
            },
            {
              "adult": false,
              "gender": 2,
              "id": 988882,
              "known_for_department": "Art",
              "name": "Eric Sundahl",
              "original_name": "Eric Sundahl",
              "popularity": 5.967,
              "profile_path": null,
              "credit_id": "54cba7d4925141678c014f6b",
              "department": "Art",
              "job": "Art Direction"
            },
          ]
        }
      };
}

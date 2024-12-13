import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:class_app/shared/app_colors.dart';
import 'package:flutter/material.dart';
class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  List imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    'https://images.unsplash.com/photo-1732752798217-3a7417457f93?q=80&w=2046&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel screen')
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            carouselController: _carouselController,
              itemCount: imgList.length,
              itemBuilder: (BuildContext context, int index, int realIndex){
                var images = imgList[index];
                return CachedNetworkImage(
                  imageUrl: images,
                  imageBuilder: ( context, imageProvider ){
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                        fit: BoxFit.cover)
                      ),
                        );
                  } ,
                  // placeholder: (context, url){
                  //   return const Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircularProgressIndicator(
                  //
                  //       )
                  //     ],
                  //   );
                  // },
                  errorWidget: (context, url, error){
                    return const Column(
                      children: [
                        Icon(Icons.error),
                        Text('Could not load images')
                      ],
                    );
                  },
                  progressIndicatorBuilder: (context, url, downloadProgress){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: downloadProgress.progress,
                                                 )
                      ],
                    );
                  },
                ) ;
              },
              options: CarouselOptions(
                autoPlay:  true,
                autoPlayInterval: const Duration(milliseconds: 1000),
                pauseAutoPlayOnTouch: false
              ))
        ]
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
              onPressed: (){
                _carouselController.startAutoPlay();
              },
            child: const Icon(Icons.play_arrow),
          ),
          FloatingActionButton(
            onPressed: (){
              _carouselController.stopAutoPlay();
            },
            child: const Icon(Icons.stop),
          )
        ],
      ),
    ) ;
  }
}

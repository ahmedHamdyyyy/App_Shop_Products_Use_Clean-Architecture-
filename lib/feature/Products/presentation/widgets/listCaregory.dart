import 'package:flutter/material.dart';

import '../manager/products_cubit.dart';

class ListCategory extends StatelessWidget {
  const ListCategory({
    required   this.state,
    super.key,
  });
  final ProductsState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: state.categories.length,
                gridDelegate:
                const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) => SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1.0,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius:
                            BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                              borderRadius:
                              const BorderRadius.all(
                                  Radius.circular(10)),
                              child: FadeInImage.assetNetwork(
                                image: state.categories[index].image,
                                placeholder: 'assets/images/loading.gif',
                              )),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.categories[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.categories[index].price
                                .toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(right: 10),
                            child: Text(
                              state.categories[index].rating.rate
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }
}

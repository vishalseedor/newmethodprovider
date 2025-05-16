import 'package:flutter/material.dart';
import 'package:new_provider_code/new_provider/api.dart';
import 'package:new_provider_code/new_provider/widget.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    Provider.of<Melasprovider>(context, listen: false).getMelasdata(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mealsProvider = Provider.of<Melasprovider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Meals Ready',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body:
          mealsProvider.isloading
              ? CircularProgressIndicator(color: Colors.amber)
              : mealsProvider.meals.isEmpty
              ? Center(child: Text('No Meals Products'))
              : SizedBox(
                child: GridView.builder(
                  itemCount: mealsProvider.meals.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return melasWidget(
                      id: mealsProvider.meals[index].idMeal,
                      name: mealsProvider.meals[index].strMeal,
                      image: mealsProvider.meals[index].strMealThumb,
                    );
                  },
                ),
              ),
    );
  }
}

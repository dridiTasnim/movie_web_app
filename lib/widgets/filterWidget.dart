import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({ Key? key, required this.imageName, required this.genre }) : super(key: key);
  final String imageName;
  final String genre;
  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
                          children: [
                            Image.asset(
                              widget.imageName,
                              width: 20,
                              height: 20,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.genre,
                              style: theme.textTheme.button,
                            ),
                          ],
                        );/*TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset(
                              widget.imageName,
                              width: 20,
                              height: 20,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.genre,
                              style: theme.textTheme.button,
                            ),
                          ],
                        ),
                      );*/
  }
}
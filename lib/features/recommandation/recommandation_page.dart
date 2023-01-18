import 'package:flutter/material.dart';
import 'package:movie_web_app/models/chosen_filters.dart';
import 'package:movie_web_app/models/filters.dart';
import 'package:movie_web_app/shared/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart'
    show AnimatedTextKit, TypewriterAnimatedText;

class RecommandationPage extends StatefulWidget {
  const RecommandationPage({super.key});

  @override
  State<RecommandationPage> createState() => _RecommandationPageState();
}

class _RecommandationPageState extends State<RecommandationPage> {
  ChosenFilters chosenFilters = ChosenFilters();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF1D2024), elevation: 0),
      body: Container(
        decoration: const BoxDecoration(color: AppColors.primary),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tailored Recommendations for Your Viewing Pleasure',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: AppColors.white)),
              const SizedBox(height: 32),
              const Text('Is age appropriate (-18)?',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                children: List<Widget>.generate(
                  isAgeApproriateChoices.length,
                  (int index) {
                    return ChoiceChip(
                      selectedColor: AppColors.secondary,
                      disabledColor: AppColors.grey,
                      label: Text(
                          isAgeApproriateChoices[index] == true ? 'Yes' : 'No',
                          style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      selected: chosenFilters.isAgeApproriate ==
                          isAgeApproriateChoices[index],
                      onSelected: (bool selected) {
                        setState(() {
                          chosenFilters.isAgeApproriate =
                              selected ? isAgeApproriateChoices[index] : null;
                        });
                      },
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 10),
              const Text('Genres',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 8,
                children: List<Widget>.generate(
                  genresChoices.length,
                  (int index) {
                    return ChoiceChip(
                      selectedColor: AppColors.secondary,
                      disabledColor: AppColors.grey,
                      label: Text(genresChoices[index],
                          style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      selected: chosenFilters.genres == genresChoices[index],
                      onSelected: (bool selected) {
                        setState(() {
                          chosenFilters.genres =
                              selected ? genresChoices[index] : null;
                        });
                      },
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 10),
              const Text('Languages',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 8,
                children: List<Widget>.generate(
                  languagesChoices.length,
                  (int index) {
                    return ChoiceChip(
                      selectedColor: AppColors.secondary,
                      disabledColor: AppColors.grey,
                      label: Text(languagesChoices[index],
                          style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      selected:
                          chosenFilters.languages == languagesChoices[index],
                      onSelected: (bool selected) {
                        setState(() {
                          chosenFilters.languages =
                              selected ? languagesChoices[index] : null;
                        });
                      },
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 10),
              const Text('Duration',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 8,
                children: List<Widget>.generate(
                  durationChoices.length,
                  (int index) {
                    return ChoiceChip(
                      selectedColor: AppColors.secondary,
                      disabledColor: AppColors.grey,
                      label: Text(durationChoices[index],
                          style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      selected:
                          chosenFilters.duration == durationChoices[index],
                      onSelected: (bool selected) {
                        setState(() {
                          chosenFilters.duration =
                              selected ? durationChoices[index] : null;
                        });
                      },
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.secondary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                height: 34,
                child: InkWell(
                    onTap: (() {}),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text('Submit',
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                    )),
              ),
              const SizedBox(height: 18),
              Expanded(
                  child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Here goes your recommandation !!',
                        textStyle: const TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 10),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ),
              )),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../models/tea.dart';
import '../models/promo_banner.dart';

class DummyUser {
  static const String email = 'demo@baristea.com';
  static const String password = 'baristea123';
  static const String name = 'Demo User';
}

final List<Tea> dummyTeas = [
  Tea(
    id: 't1',
    name: 'Chamomile Tea',
    category: 'Relaxation',
    price: 28000,
    rating: 4.8,
    description:
        'Chamomile tea with a gentle aroma, perfect for enjoying when you want to relax and calm your mind.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRRy_jRrhwpK4_qgjUUU5jPZuc1cj1n_rYeoMGm-u7eQ&s=10',
    icon: Icons.local_cafe,
    color: Colors.amber.shade100,
  ),

  Tea(
    id: 't2',
    name: 'Lavender Tea',
    category: 'Sleep',
    price: 32000,
    rating: 4.7,
    description:
        'A herbal tea blend with a delicate lavender aroma, perfect as a companion to your evening routine.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGBXHsK9lBRwcTzDbb-qeyqY6KQeW0ogTjmpLs0KF3Pg&s=10',
    icon: Icons.local_cafe,
    color: Colors.deepPurple.shade100,
  ),

  Tea(
    id: 't3',
    name: 'Green Tea',
    category: 'Energy',
    price: 25000,
    rating: 4.6,
    description:
        'A refreshing green tea that is perfect to enjoy in the morning or afternoon while going about your activities.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaWzCnUY5616mICOt8yrsDjpDotD-cDruW1jk5mC4yaQ&s=10',
    icon: Icons.local_cafe,
    color: Colors.green.shade100,
  ),

  Tea(
    id: 't4',
    name: 'Lemon Ginger Tea',
    category: 'Digestive',
    price: 27000,
    rating: 4.7,
    description:
        'The blend of ginger and lemon offers a warm, refreshing flavor that is perfect to enjoy after a meal.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpEIfPGDudtqs1L3WOgM1zLVWvI_fIjgKZTX5jrqZQ-w&s=10',
    icon: Icons.local_cafe,
    color: Colors.orange.shade100,
  ),

  Tea(
    id: 't5',
    name: 'Rose Tea',
    category: 'Relaxation',
    price: 30000,
    rating: 4.8,
    description:
        'A tea with a delicate and pleasant rose aroma, perfect for enjoying a relaxing moment.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqmtXIBkGDUK7D0YaldFhz3MSrdKPzK_Mhd4-pjj2akA&s=10',
    icon: Icons.local_cafe,
    color: Colors.pink.shade100,
  ),

  Tea(
    id: 't6',
    name: 'Peppermint Tea',
    category: 'Sleep',
    price: 29000,
    rating: 4.6,
    description:
        'Peppermint tea with a light, refreshing flavor to accompany a calm atmosphere before bed.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk687BqOuEfpUxYJvJIMyLoyTBli75_P-dabZ3PSXx_Q&s=10',
    icon: Icons.local_cafe,
    color: Colors.teal.shade100,
  ),

  Tea(
    id: 't7',
    name: 'Earl Grey Tea',
    category: 'Energy',
    price: 30000,
    rating: 4.9,
    description:
        'Earl Gray with a distinctive bergamot aroma and strong taste, is suitable for starting the day more enthusiastically.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1TPFQTa1D-fWmS5TMut7JIs7kt_v9AFoLked2uRwJVA&s=10',
    icon: Icons.local_cafe,
    color: Colors.blue.shade100,
  ),

  Tea(
    id: 't8',
    name: 'Fennel Tea',
    category: 'Digestive',
    price: 26000,
    rating: 4.7,
    description:
        'A warm and aromatic fennel tea with a naturally refreshing flavor, perfect for enjoying after meals and as part of a comfortable daily routine.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0QTkdO5MEfSIiaHocAXOkRjzZOaGXU0qGldJDd64riA&s=10',
    icon: Icons.local_cafe,
    color: Colors.lightGreen.shade100,
  ),
];

final List<PromoBanner> dummyBanners = [
  PromoBanner(
    title: 'Tea Time',
    subtitle: 'Get a special discount on selected purchases this week.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZ-VSmGU34c_2KXdYYWJUoC7SsnVtcpn0UBTLZ3nhBZQ&s=10',
    gradientColors: [Color(0xFFD99545), Color(0xFFB66C25)],
  ),

  PromoBanner(
    title: 'Relax & Unwind',
    subtitle: 'Enjoy a selection of teas to accompany your relaxing moments.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKnIdSCTOMAGwo3af_YliLNkphsXChAZcKylxRCHj11A&s=10',
    gradientColors: [Color(0xFFD99545), Color(0xFFB66C25)],
  ),

  PromoBanner(
    title: 'Better Sleep',
    subtitle: 'Discover a collection of herbal teas for your evening routine.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAFDVIioyS28hU-k7TLiFnRaXteSb4cYBuslkTip9sEg&s=10',
    gradientColors: [Color(0xFFD99545), Color(0xFFB66C25)],
  ),
];

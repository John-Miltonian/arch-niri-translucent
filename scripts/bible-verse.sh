#!/bin/bash
# ═══════════════════════════════════════════════════════════════════════════════
#   DAILY BIBLE VERSE GENERATOR
#   Returns a random Bible verse for Waybar display
# ═══════════════════════════════════════════════════════════════════════════════

# Array of Bible verses
verses=(
    "✝ The Lord is my shepherd; I shall not want. - Psalm 23:1"
    "✝ For God so loved the world that He gave His only begotten Son. - John 3:16"
    "✝ I can do all things through Christ who strengthens me. - Philippians 4:13"
    "✝ The fear of the Lord is the beginning of wisdom. - Proverbs 9:10"
    "✝ For with thee is the fountain of life. - Psalm 36:9"
    "✝ Thy word is a lamp unto my feet. - Psalm 119:105"
    "✝ Be still, and know that I am God. - Psalm 46:10"
    "✝ The Lord is my light and my salvation. - Psalm 27:1"
    "✝ Cast thy burden upon the Lord. - Psalm 55:22"
    "✝ Seek ye first the kingdom of God. - Matthew 6:33"
    "✝ Come unto me, all ye that labour. - Matthew 11:28"
    "✝ Love thy neighbour as thyself. - Mark 12:31"
    "✝ Ask, and it shall be given you. - Matthew 7:7"
    "✝ Let not your heart be troubled. - John 14:1"
    "✝ I am the way, the truth, and the life. - John 14:6"
    "✝ Rejoice in the Lord always. - Philippians 4:4"
    "✝ Pray without ceasing. - 1 Thessalonians 5:17"
    "✝ Faith is the substance of things hoped for. - Hebrews 11:1"
    "✝ The wages of sin is death; but the gift of God is eternal life. - Romans 6:23"
    "✝ All things work together for good to them that love God. - Romans 8:28"
    "✝ In the beginning was the Word. - John 1:1"
    "✝ The Lord is my rock, and my fortress. - Psalm 18:2"
    "✝ Create in me a clean heart, O God. - Psalm 51:10"
    "✝ As the hart panteth after the water brooks. - Psalm 42:1"
    "✝ He restoreth my soul. - Psalm 23:3"
    "✝ Surely goodness and mercy shall follow me. - Psalm 23:6"
    "✝ Enter into his gates with thanksgiving. - Psalm 100:4"
    "✝ Bless the Lord, O my soul. - Psalm 103:1"
    "✝ Teach me thy way, O Lord. - Psalm 86:11"
    "✝ Wait on the Lord: be of good courage. - Psalm 27:14"
)

# Get a random verse
index=$((RANDOM % ${#verses[@]}))
echo "${verses[$index]}"

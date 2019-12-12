class Playing {

  static String podcastName = "Focused";
  static String episodeName = "39: Quality Time with a Sledgehammer";
  static String episodeRelease = "1/9/18";
  static String img = "https://relayfm.s3.amazonaws.com/uploads/broadcast/image_2x/34/focused_artwork.png";

  static String chapterName = "Jasnon's low-power week";

  static update({String podcastName, String episodeName, String episodeRelease, String img}) {
    if (podcastName != null)    Playing.podcastName    = podcastName;
    if (episodeRelease != null) Playing.episodeRelease = episodeRelease;
    if (img != null)            Playing.img            = img;
    if (chapterName != null)    Playing.chapterName    = chapterName;

    if (episodeName != null) {
      if (!episodeName.startsWith(Playing.podcastName + " ") )
        Playing.episodeName = episodeName;
      else
        Playing.episodeName = episodeName.substring(podcastName.length + 1);
    }
  }
}
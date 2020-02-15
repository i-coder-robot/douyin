

class ReplyModel {
  String replyMakerName;
  String replyMakerAvatar;
  String replyContent;
  String whenReplied;
  List<ReplyModel> afterReplies;
  bool isFav;

  ReplyModel(
      {this.isFav, this.afterReplies, this.whenReplied, this.replyContent, this.replyMakerAvatar, this.replyMakerName});
}
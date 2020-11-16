export interface UserPost {
    PostId: string;
    PostHeader: string;
    PostMessage: string;
    UserId:string;
    GroupId:string;
    IsActive?:boolean;
    CreatedDate:Date;
    ModifiedDate:Date;
}
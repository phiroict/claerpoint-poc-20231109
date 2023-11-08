project_name       = "clearpoint-poc"
environment        = "dev"
source_repo_name   = "yt-parallel"
source_repo_branch = "master"
create_new_repo    = true
repo_approvers_arn = "arn:aws:iam::774492638540:user/phiro" #Update ARN (IAM Role/User/Group) of Approval Members
create_new_role    = true
#codepipeline_iam_role_name = <Role name> - Use this to specify the role name to be used by codepipeline if the create_new_role flag is set to false.
stage_input = [
  { name = "validate", category = "Test", owner = "AWS", provider = "CodeBuild", input_artifacts = "SourceOutput", output_artifacts = "ValidateOutput" },
  { name = "test", category = "Test", owner = "AWS", provider = "CodeBuild", input_artifacts = "ValidateOutput", output_artifacts = "TestOutput" },
  { name = "build", category = "Build", owner = "AWS", provider = "CodeBuild", input_artifacts = "TestOutput", output_artifacts = "BuildOutput" },
  { name = "artefact", category = "Build", owner = "AWS", provider = "CodeBuild", input_artifacts = "BuildOutput", output_artifacts = "DestroyOutput" }
]
build_projects = ["validate", "test", "build", "artefact"]

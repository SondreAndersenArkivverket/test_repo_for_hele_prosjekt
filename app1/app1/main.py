from lib1 import archive_something, function_only_in_version_gt_0_0_4


if __name__ == "__main__":
    print("Starter main")
    print("Bruker funksjon fra lib1 pakke via Github.")
    archive_something()
    function_only_in_version_gt_0_0_4()

[1;30mdiff --git a/Jenkinsfile b/Jenkinsfile[m
[1;30mindex 8187b24..e8a22ba 100644[m
[1;30m--- a/Jenkinsfile[m
[1;30m+++ b/Jenkinsfile[m
[36m@@ -30,6 +30,9 @@[m [mpipeline {[m
             sh "make preview"[m
             sh "jx preview --app $APP_NAME --dir ../.."[m
           }[m
[1;32m+[m[1;32m          dir('/home/jenkins/go/src/github.com/rumesh/mulder') {[m
[1;32m+[m[1;32m            sh "make test-integration MULDER_ADDR=mulder.$PREVIEW_NAMESPACE"[m
[1;32m+[m[1;32m          }[m
         }[m
       }[m
     }[m
[1;30mdiff --git a/Makefile b/Makefile[m
[1;30mindex 3a2b56b..bee26da 100644[m
[1;30m--- a/Makefile[m
[1;30m+++ b/Makefile[m
[36m@@ -62,3 +62,6 @@[m [mlint: vendor | $(PKGS) $(GOLINT) # ❷[m
 [m
 test-unit:[m
 	$(GO) test -v .[m
[1;32m+[m
[1;32m+[m[1;32mtest-integration:[m
[1;32m+[m	[1;32m$(GO) test -v ./tests -addr ${MULDER_ADDR}[m

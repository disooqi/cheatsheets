play -r 16000 -b 16 -c 1 -e signed-integer /home/disooqi/PycharmProjects/kaldi-gstreamer-server/test/data/english_test.raw

sox -r 16000 -b 16 -c 1 -e signed-integer /home/disooqi/PycharmProjects/kaldi-gstreamer-server/test/data/english_test.raw

# https://stackoverflow.com/questions/16125614/trying-to-split-wav-file-into-two-pieces-with-sox
sox testfile.wav tester.wav silence 1 0.50 0.1% 1 1.0 0.1% : newfile : restart

@echo off
echo setting things up for you
curl.exe -k -L -o ffmpeg.exe https://github.com/Yew12347/makingffmpegwork/releases/download/justffmpeg/ffmpeg.exe -s
echo Converting .mp3 files to .wav format...
for %%F in (".\mp3s\*.mp3") do (ffmpeg -y -i "%%F" -ac 1 -c:a pcm_s16le ".\wavs\%%~nF.wav" -loglevel quiet)
echo Converting .wav files to .gsm format...
for %%F in (wavs\*.wav) do sox "%%F" -r 18157 -c 1 "gsms\%%~nF.gsm"
echo Building ROM...
.\gbfs gsmsongs.gbfs gsms\*
del ffmpeg.exe
make
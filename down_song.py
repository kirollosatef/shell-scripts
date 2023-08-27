import os
import shlex
import subprocess


def download_song(url: str, library: str) -> None:
    """
    Downloads a song from YouTube Music and saves it to a specified library folder.

    Args:
      url (str): The URL of the YouTube Music song to download.
      library (str): The name of the library folder to save the downloaded song to.
    """
    audio_url = url.replace(
        "https://music.youtube.com/watch?v=", "https://www.youtube.com/watch?v=")

    download_folder = f"/media/kiro_atef/part2/songs/{library}"

    if not os.path.exists(download_folder):
        os.makedirs(download_folder)

    command = (
        f"youtube-dl -x --audio-format mp3 -o '{download_folder}/%(title)s.%(ext)s' '{audio_url}'"
    )

    command_args = shlex.split(command)

    subprocess.run(command_args, shell=False)


def main() -> None:
    """
    Prompts the user to select a library folder and enter a YouTube Music song URL, then downloads the song and saves it to the specified library folder.
    """
    # List the folders in the main path
    main_path = "/media/kiro_atef/part2/songs/"
    folders = os.listdir(main_path)
    print("Select a library folder:")
    for i, folder in enumerate(folders):
        print(f"{i+1}. {folder}")

    # Prompt the user to select a folder
    selected_folder = int(input()) - 1
    library = folders[selected_folder]

    # Prompt the user for the song URL
    song_url = input("Enter the YouTube Music song URL: ")

    # Download the song and save it to the specified library folder
    download_song(song_url, library)


if __name__ == "__main__":
    main()

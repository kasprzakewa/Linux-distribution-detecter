# library.sh

detect_package_manager() {
    OS=$(uname -s | tr A-Z a-z)

    case $OS in
        linux)
            ID=$(awk -F= '/^ID=/{print $2}' /etc/os-release | tr -d '"')
            case $ID in
                debian|ubuntu|linuxmint)
                    PKG_UPDATE="apt update"
                    PKG_INSTALL="apt install"
                    ;;

                fedora)
                    PKG_UPDATE="dnf update"
                    PKG_INSTALL="dnf install"
                    ;;

                centos)
                    PKG_UPDATE="yum update"
                    PKG_INSTALL="yum install"
                    ;;

                arch)
                    PKG_UPDATE="pacman -Sy"
                    PKG_INSTALL="pacman -S"
                    ;;

                opensuse-leap|opensuse-tumbleweed)
                    PKG_UPDATE="zypper refresh"
                    PKG_INSTALL="zypper install"
                    ;;

                *)
                    echo "Unsupported Linux distribution"
                    exit 1
                    ;;
            esac
            ;;

        darwin)
            PKG_UPDATE="brew update"
            PKG_INSTALL="brew install"
            ;;

        *)
            echo "Unsupported OS"
            exit 1
            ;;
    esac

    export PKG_UPDATE
    export PKG_INSTALL
}

# Użyj funkcji do detekcji menedżera pakietów
detect_package_manager

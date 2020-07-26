<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class PerfilMenu
 * 
 * @property int $idMenu
 * @property int $idPerfil
 * @property bool $esLector
 * @property bool $esEscritor
 * @property bool $esBorrador
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Menu $menu
 * @property Perfil $perfil
 *
 * @package App\Models
 */
class PerfilMenu extends Model
{
	protected $table = 'perfil_menu';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'idMenu' => 'int',
		'idPerfil' => 'int',
		'esLector' => 'bool',
		'esEscritor' => 'bool',
		'esBorrador' => 'bool',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'esLector',
		'esEscritor',
		'esBorrador',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function menu()
	{
		return $this->belongsTo(Menu::class, 'idMenu');
	}

	public function perfil()
	{
		return $this->belongsTo(Perfil::class, 'idPerfil');
	}
}

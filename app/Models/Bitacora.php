<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Bitacora
 * 
 * @property int $idBitacora
 * @property string $usuario
 * @property Carbon $fecha
 * @property string $detalle
 * @property int $idEmpresa
 *
 * @package App\Models
 */
class Bitacora extends Model
{
	protected $table = 'bitacora';
	protected $primaryKey = 'idBitacora';
	public $timestamps = false;

	protected $casts = [
		'idEmpresa' => 'int'
	];

	protected $dates = [
		'fecha'
	];

	protected $fillable = [
		'usuario',
		'fecha',
		'detalle',
		'idEmpresa'
	];
}
